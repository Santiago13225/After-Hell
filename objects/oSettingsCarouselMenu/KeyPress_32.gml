//Store selected match setting and go to map select
//global.match_setting_index = item;
global.matchPresetIndex = item;

//Proceed to map selection carousel
instance_destroy();
//instance_create_layer(0, 0, "Instances", oCarouselMenu);
instance_create_layer(0, 0, "Instances", oPerkCarouselMenu);