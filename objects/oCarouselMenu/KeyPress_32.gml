//Store the selected map sprite in a global variable for the HUD/scoreboard
global.selectedMapSprite = item;//Use the sprite you are displaying in the carousel
//global.selectedMapName = text;//Store the map name for text display if needed

switch(global.selectedMapSprite){
	case 0:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM1_2, sqFadeOut, sqFadeIn);
		break;
	case 1:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM2_2, sqFadeOut, sqFadeIn);
		break;
	case 2:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM3_2, sqFadeOut, sqFadeIn);
		break;
	case 3:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM4_2, sqFadeOut, sqFadeIn);
		break;
	case 4:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM5_2, sqFadeOut, sqFadeIn);
		break;
	case 5:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM6_2, sqFadeOut, sqFadeIn);
		break;
	case 6:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM7_2, sqFadeOut, sqFadeIn);
		break;
	case 7:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM8_2, sqFadeOut, sqFadeIn);
		break;
	case 8:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM9_2, sqFadeOut, sqFadeIn);
		break;
	case 9:
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM10_2, sqFadeOut, sqFadeIn);
		break;
	case 10:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM11_2, sqFadeOut, sqFadeIn);
		break;
	case 11:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM12_2, sqFadeOut, sqFadeIn);
		break;
	case 12:
		global.screenShake = true;
		oHUD2.playerTotalScore = 500;
		TransitionStart(rm_TM13_2, sqFadeOut, sqFadeIn);
		break;
}