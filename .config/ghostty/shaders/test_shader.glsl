void mainImage(out vec4 fragColor, in vec2 fragCoord) {
	fragColor = texture(iChannel0, fragCoord.xy / iResolution.xy);
	vec4 bgColor = vec4(192.0f/255.0f,192.0f/255.0f,192.0f/255.0f,1);
	//darkness = 0.753;
	/*if (distance(fragColor,vec4(darkness,darkness,darkness,1) <= 0.1) {
		fragColor = vec4(1,0,0,1);
	}*/
	float d = distance(fragColor,bgColor);
	if (d < 0.1) {
		//fragColor = vec4(1,0,0,1);
	}
	//fragColor = vec4(d,d,d,1);
	//fragColor = fragColor + vec4(0.1f,0.1f,0.1f,0);
}
