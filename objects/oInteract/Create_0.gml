///@description
image_speed = 0;

popup_id = instance_create_layer(x, y - 16, layer, oPopup);

radius = 15;
has_been_interacted = false;

with(popup_id){
	visible = false;
}