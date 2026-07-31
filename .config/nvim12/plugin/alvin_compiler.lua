local state = {
  buf = -1,
  win = -1,
  job = -1,
}
local project = {
  root = nil,
  compile_command = nil,
}
local json_data = {}
local function get_project_root()
  return vim.fs.root(0, {".git"}) or vim.uv.cwd()
end
local function load_project()
  project.root = get_project_root()
  local path = vim.fn.stdpath("data") .. "/compilecommands.json"
  if vim.fn.filereadable(path) == 1 then
    json_data = vim.json.decode(table.concat(vim.fn.readfile(path), "\n")) or {}
    project.compile_command = json_data[project.root] or nil
  end
end
local function save_project()
  json_data[project.root] = project.compile_command
  local path = vim.fn.stdpath("data") .. "/compilecommands.json"
  vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
  local json = vim.json.encode(json_data)
  vim.fn.writefile({json},path)
end
local function create_buf()
  if vim.api.nvim_buf_is_valid(state.buf) then
    if state.job > 0 then
      pcall(vim.fn.chansend,state.job, "\003")
      state.job = -1
    end
    os.execute("sleep 0.2");
    vim.api.nvim_buf_delete(state.buf, {force=true})
  end
  state.buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_call(state.buf, function()
    state.job = vim.fn.jobstart(project.compile_command, {term = true})
  end)
end
local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
  }
  if vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true);
  end
  state.win = vim.api.nvim_open_win(state.buf, true, win_config)
end

vim.api.nvim_create_user_command("Compile", function()
  if project.compile_command == nil then
    print("No compile command specified!")
  else
    create_buf()
    create_floating_window()
  end
end, {})
vim.api.nvim_create_user_command("CompileView", function()
  if vim.api.nvim_buf_is_valid(state.buf) then
    create_floating_window()
  else
    print("No compilation window available")
  end
end, {})
vim.api.nvim_create_user_command("CompileClose", function()
  if vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true);
  end
  if vim.api.nvim_buf_is_valid(state.buf) then
    vim.api.nvim_buf_delete(state.buf, {force = true});
  end
  state.win = -1;
  state.buf = -1;
end, {})
vim.api.nvim_create_user_command("CompileCommand", function()
  vim.ui.input({
    prompt = "Compile Command: ",
    default = project.compile_command or "",
  }, function (cc)
    if cc then
      project.compile_command = cc
      save_project()
    end
  end)
end, {})
  if project.root == nil then
    load_project()
  end
