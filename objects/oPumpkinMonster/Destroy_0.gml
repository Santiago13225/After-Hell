///oZombie Destroy Event
/*This object represents a Zombie.*/
//This event is responsible for destroying bullets.

if instance_exists(bulletInst) && bulletInst.state == 0
{//Get rid of bullet if we haven't shot it yet.
	bulletInst.destroy = true;
}

//pumpkin bomb
instance_create_depth(x, y, depth, oPumpkinBomb);