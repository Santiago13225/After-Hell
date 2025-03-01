if(counter < 0){
	inst = instance_create_layer(scrollX, scrollY, "Instances", oText);
	inst.text = scroll[line];
	
	counter = 30 + string_width(scroll[line]);
	line += 1;
	if(line >= arraylength){
		line = 0;
		counter += 100;
	}
}

counter -= 1;
