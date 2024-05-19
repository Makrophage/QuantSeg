var QuantSegMenu = newMenu("QuantSeg Menu Tool", newArray("QuantSeg")); 

macro "QuantSeg Menu Tool - Ce96D05D0eD0fD17D19D1cD23D2bD2dD2fD41D5aD6eD6fD73D7aD7cD7dD7eD7fD83D84D8fDbdDc2DcbDd0Dd9De5DeeDefDfdCe99D01D02D11D12D21D22D26D31D32D42D51D69Da5Db1De3Cec6D20D30D40D4aD50D60D70D80D90Da0Da3Db3DbfDc3DdfDebDf4Df6Df8DfaDfbDfeCe76D08D09D0bD0cD0dD15D1eD2eD36D3eD47D4dD61D63D74D85D8aDb6DceDd2De0De1De2De9Df1Df2DffCfdaD14D76D77D78D89D94D9aDa4Dc4Dc7DcaCe65D35D45D4eD4fD55D75DacDc1Dd1CfffD87D88D97D98D99Da7Da8Da9Db8Db9DbaDc8CfedD24D86D96DaaDb4Db7Dc5Dc9Ce95D72D81D8eDaeDcdDdcDddDecDedDf0Ceb6D1fD27D4bD6aD82D8cD8dD92D93D9cD9dD9eDadDafDb0Db2DeaDf3Df5Df7Ce56D43D44D54D57D64DbcDccDe7CfccD52D62Db5Dd4Dd5Ce66D33D3fD46D53D5dD65D68D9bDc6Dd6Dd7De8Ce87D00D03D07D0aD13D18D1aD1bD28D2aD34D4cD58D6dD79D91D95Da1DabDdeCe74D25D3cD56D5eD66D67D6cD71D8bDbeDdaDdb"{
	cmd = getArgument();
	
	if(cmd == "QuantSeg"){
		//Macro version 1.2.5"
		ini_path = "### PATH TO INI ###"; //<<<<<< INSERT PATH TO INI FILE THERE!
		///////////////////////////////////////////////////////////////////////////////////////
		//DO NOT CHANGE ANYTHING BELOW!//
		
		
		
		
		
		if(ini_path == "### PATH TO INI ###"){ //DO NOT CHANGE THIS LINE//
			showMessage("Error", "No path to the initiation file has been given in line 1067. Please check.");
			exit();
		}
		ini_path_array = split(ini_path, "\\");
		ini_file_name = ini_path_array[ini_path_array.length-1];
		
		ini_dir = "";
		for(i=0; i<ini_path_array.length-1; i++){
			ini_dir += ini_path_array[i]+"\\";
		}
		cmd_command = "";
		for(i=0; i<ini_path_array.length; i++){
			cmd_command += ini_path_array[i]+"\\";
		}
		cmd_command = substring(cmd_command, 0, cmd_command.length-1);
		
		//Check if initiation file can be found at the specified path
		if(!File.exists(ini_path)){
			showMessage("Error", ini_file_name+" could not be found at the path given in line 1067. Please check.");
			exit();
		}
		
		ini_str = File.openAsString(ini_path);
		ini_array = split(ini_str, "\n");
		ini_array = Array.deleteValue(ini_array, "");
		
		//Remove Section headers
		for(i=0; i<ini_array.length; i++){
			ini_array[i] = replace(ini_array[i], " ", "");
			if(matches(ini_array[i], ".*\\[.*")){
				ini_array = Array.deleteIndex(ini_array, i);
				i--;
			}
		}
		
		PERF_SEGM_CHECKER = false;
		PERF_ANALYSIS_CHECKER = false;
		PERF_ANALYSIS_WO_SEGM_CHECKER = false;
		RSL_CHECKER = false;
		STRATA_CHECKER = false;
		COMB_CHECKER = false;
		MIN_HEART_CHECKER = false;
		MIN_VENT_CHECKER = false;
		MAX_VENT_CHECKER = false;
		EPI_CHECKER = false;
		ENDO_CHECKER = false;
		SUBEND_CHECKER = false;
		SUBEPI_CHECKER = false;
		SILH_LOW_CHECKER = false;
		SILH_UP_CHECKER = false;
		FURTH_CHECKER = false;
		VASC_THR_CHECKER = false;
		MAX_BLOODV_CHECKER = false;
		MIN_BLOODV_CHECKER = false;
		MIN_LUMEN_CHECKER = false;
		RV_THR_CHECKER = false;
		LV_DIFF_THR_CHECKER = false;
		LV_CORR_CHECKER = false;
		HIGH_RES_CHECKER = false;
		MANUAL_THRE_CHECKER = false;
		EXCL_PERIV_CHECKER = false;
		BACK_LOW_CHECKER = false;
		BACK_UP_CHECKER = false;
		PARE_LOW_CHECKER = false;
		PARE_UP_CHECKER = false;
		COLL_LOW_CHECKER = false;
		COLL_UP_CHECKER = false;
		RSL_OVER_CHECKER = false;
		RSL_STACK_CHECKER = false;
		STRATA_OVER_CHECKER = false;
		STRATA_STACK_CHECKER = false;
		COMB_OVER_CHECKER = false;
		COMB_STACK_CHECKER = false;
		ROIS_ZIP_CHECKER = false;
		FALSECOLOR_CHECKER = false;
		RAW_CSV_CHECKER = false;
		RAW_XLSX_CHECKER = false;
		PROC_CSV_CHECKER = false;
		PROC_XLSX_CHECKER = false;
		SET_SCALE_CHECKER = false;
		SCALE_CHECKER = false;
		UNIT_CHECKER = false;
		SWITCH_CHECKER = false;
		DCR_THRESH_CHECKER = false;
		DCR_WOH_CHECKER = false;
		RSL_SKETCH_CHECKER = false;
		STRATA_SKETCH_CHECKER = false;
		COMBINATION_SKETCH_CHECKER = false;
		WHITEN_CHECKER = false;
		pattern1419 = false;
		pattern1424 = false;
		pattern1924 = false;
		pattern2930 = false;
		
		//Initialize Parameters
		for(i=0; i<ini_array.length; i++){
			if(matches(ini_array[i], "^(PERFORM_SEGMENTATION=).*")){
				setting = replace(ini_array[i], "PERFORM_SEGMENTATION=", "");
				if(setting == "1"){
					PERFORM_SEGMENTATION = true;
					PERF_SEGM_CHECKER = true;
				}
				else if(setting == "0"){
					PERFORM_SEGMENTATION = false;
					PERF_SEGM_CHECKER = true;
				}
				else{
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"PERFORM_SEGMENTATION\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(PERFORM_ANALYSIS=).*")){
				setting = replace(ini_array[i], "PERFORM_ANALYSIS=", "");
				if(setting == "1"){
					PERFORM_ANALYSIS = true;
					PERF_ANALYSIS_CHECKER = true;
				}
				else if(setting == "0"){
					PERFORM_ANALYSIS = false;
					PERF_ANALYSIS_CHECKER = true;
				}
				else{
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"PERFORM_ANALYSIS\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(PERFORM_ANALYSIS_WITHOUT_SEGMENTATION=).*")){
				setting = replace(ini_array[i], "PERFORM_ANALYSIS_WITHOUT_SEGMENTATION=", "");
				if(setting == "1"){
					PERFORM_ANALYSIS_WITHOUT_SEGMENTATION = true;
					PERF_ANALYSIS_WO_SEGM_CHECKER = true;
				}
				else if(setting == "0"){
					PERFORM_ANALYSIS_WITHOUT_SEGMENTATION = false;
					PERF_ANALYSIS_WO_SEGM_CHECKER = true;
				}
				else{
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"PERFORM_ANALYSIS_WITHOUT_SEGMENTATION\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(DIFFERENTIATE_RSL=).*")){
				setting = replace(ini_array[i], "DIFFERENTIATE_RSL=", "");
				if(setting == "1"){
					DIFFERENTIATE_RSL = true;
					RSL_CHECKER = true;
				}
				else if(setting == "0"){
					DIFFERENTIATE_RSL = false;
					RSL_CHECKER = true;
				}
				else{
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"DIFFERENTIATE_RSL\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(DIFFERENTIATE_STRATA=).*")){
				setting = replace(ini_array[i], "DIFFERENTIATE_STRATA=", "");
				if(setting == "1"){
					DIFFERENTIATE_STRATA = true;
					STRATA_CHECKER = true;
				}
				else if(setting == "0"){
					DIFFERENTIATE_STRATA = false;
					STRATA_CHECKER = true;
				}
				else{
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"DIFFERENTIATE_STRATA\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(DIFFERENTIATE_COMBINATION=).*")){
				setting = replace(ini_array[i], "DIFFERENTIATE_COMBINATION=", "");
				if(setting == "1"){
					DIFFERENTIATE_COMBINATION = true;
					COMB_CHECKER = true;
				}
				else if(setting == "0"){
					DIFFERENTIATE_COMBINATION = false;
					COMB_CHECKER = true;
				}
				else{
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"DIFFERENTIATE_COMBINATION\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(MINIMUM_HEART_AREA=).*")){
				setting = replace(ini_array[i], "MINIMUM_HEART_AREA=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"MINIMUM_HEART_AREA\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					MINIMUM_HEART_AREA = parseFloat(setting);
					MIN_HEART_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(MINIMUM_VENTRICLE_AREA=).*")){
				setting = replace(ini_array[i], "MINIMUM_VENTRICLE_AREA=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"MINIMUM_VENTRICLE_AREA\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					MINIMUM_VENTRICLE_AREA = parseFloat(setting);
					MIN_VENT_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(MAXIMUM_VENTRICLE_AREA=).*")){
				setting = replace(ini_array[i], "MAXIMUM_VENTRICLE_AREA=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"MAXIMUM_VENTRICLE_AREA\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					MAXIMUM_VENTRICLE_AREA = parseFloat(setting);
					MAX_VENT_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(EPICARDIAL_THICKNESS=).*")){
				setting = replace(ini_array[i], "EPICARDIAL_THICKNESS=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"EPICARDIAL_THICKNESS\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					EPICARDIAL_THICKNESS = parseFloat(setting);
					EPI_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(ENDOCARDIAL_THICKNESS=).*")){
				setting = replace(ini_array[i], "ENDOCARDIAL_THICKNESS=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"ENDOCARDIAL_THICKNESS\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					ENDOCARDIAL_THICKNESS = parseFloat(setting);
					ENDO_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(SUBENDOCARDIAL_THICKNESS=).*")){
				setting = replace(ini_array[i], "SUBENDOCARDIAL_THICKNESS=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SUBENDOCARDIAL_THICKNESS\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					SUBENDOCARDIAL_THICKNESS = parseFloat(setting);
					SUBEND_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(SUBEPICARDIAL_THICKNESS=).*")){
				setting = replace(ini_array[i], "SUBEPICARDIAL_THICKNESS=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SUBEPICARDIAL_THICKNESS\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					SUBEPICARDIAL_THICKNESS = parseFloat(setting);
					SUBEPI_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD=).*")){
				setting = replace(ini_array[i], "SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD = parseFloat(setting);
					SILH_LOW_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD=).*")){
				setting = replace(ini_array[i], "SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD = parseFloat(setting);
					SILH_UP_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(SWITCH_VENTRICLES=).*")){
				setting = replace(ini_array[i], "SWITCH_VENTRICLES=", "");
				if(setting == "1"){
					SWITCH_VENTRICLES = true;
					SWITCH_CHECKER = true;
				}
				else if(setting == "0"){
					SWITCH_VENTRICLES = false;
					SWITCH_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SWITCH_VENTRICLES\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(EXCLUDE_PERIVASCULAR_COLLAGEN=).*")){
				setting = replace(ini_array[i], "EXCLUDE_PERIVASCULAR_COLLAGEN=", "");
				if(setting == "1"){
					EXCLUDE_PERIVASCULAR_COLLAGEN = true;
					EXCL_PERIV_CHECKER = true;
				}
				else if(setting == "0"){
					EXCLUDE_PERIVASCULAR_COLLAGEN = false;
					EXCL_PERIV_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"EXCLUDE_PERIVASCULAR_COLLAGEN\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(VASCULAR_RECOGNITION_THRESHOLD=).*")){
				setting = replace(ini_array[i], "VASCULAR_RECOGNITION_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION && EXCLUDE_PERIVASCULAR_COLLAGEN){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"VASCULAR_RECOGNITION_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					VASCULAR_RECOGNITION_THRESHOLD = parseFloat(setting);
					VASC_THR_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(MAXIMUM_BLOOD_VESSEL_AREA=).*")){
				setting = replace(ini_array[i], "MAXIMUM_BLOOD_VESSEL_AREA=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION && EXCLUDE_PERIVASCULAR_COLLAGEN){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"MAXIMUM_BLOOD_VESSEL_AREA\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					MAXIMUM_BLOOD_VESSEL_AREA = parseFloat(setting);
					MAX_BLOODV_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(MINIMUM_BLOOD_VESSEL_AREA=).*")){
				setting = replace(ini_array[i], "MINIMUM_BLOOD_VESSEL_AREA=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION && EXCLUDE_PERIVASCULAR_COLLAGEN){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"MINIMUM_BLOOD_VESSEL_AREA\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					MINIMUM_BLOOD_VESSEL_AREA = parseFloat(setting);
					MIN_BLOODV_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(MINIMUM_LUMEN_AREA=).*")){
				setting = replace(ini_array[i], "MINIMUM_LUMEN_AREA=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION && EXCLUDE_PERIVASCULAR_COLLAGEN){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"MINIMUM_LUMEN_AREA\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					MINIMUM_LUMEN_AREA = parseFloat(setting);
					MIN_LUMEN_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(RV_ANGLE_THRESHOLD=).*")){
				setting = replace(ini_array[i], "RV_ANGLE_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"RV_ANGLE_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					RV_ANGLE_THRESHOLD = parseFloat(setting);
					RV_THR_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(LV_ANGLE_DIFFERENCE_THRESHOLD=).*")){
				setting = replace(ini_array[i], "LV_ANGLE_DIFFERENCE_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"LV_ANGLE_DIFFERENCE_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					LV_ANGLE_DIFFERENCE_THRESHOLD = parseFloat(setting);
					LV_DIFF_THR_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(LV_ANGLE_CORRECTION_FACTOR=).*")){
				setting = replace(ini_array[i], "LV_ANGLE_CORRECTION_FACTOR=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"LV_ANGLE_CORRECTION_FACTOR\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					LV_ANGLE_CORRECTION_FACTOR = parseFloat(setting);
					LV_CORR_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION=).*")){
				setting = replace(ini_array[i], "ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION=", "");
				if(setting == "1"){
					ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION = true;
					HIGH_RES_CHECKER = true;
				}
				else if(setting == "0"){
					ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION = false;
					HIGH_RES_CHECKER = true;
				}
				else{
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(DECREASE_HIGH_RESOLUTION_THRESHOLD=).*")){
				setting = replace(ini_array[i], "DECREASE_HIGH_RESOLUTION_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"DECREASE_HIGH_RESOLUTION_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					DECREASE_HIGH_RESOLUTION_THRESHOLD = parseFloat(setting);
					DCR_THRESH_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(DECREASE_WIDTH_OR_HEIGHT_TO=).*")){
				setting = replace(ini_array[i], "DECREASE_WIDTH_OR_HEIGHT_TO=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"DECREASE_WIDTH_OR_HEIGHT_TO=\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					DECREASE_WIDTH_OR_HEIGHT_TO = parseFloat(setting);
					DCR_WOH_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(CHOOSE_THRESHOLDS_MANUALLY=).*")){
				setting = replace(ini_array[i], "CHOOSE_THRESHOLDS_MANUALLY=", "");
				if(setting == "1"){
					CHOOSE_THRESHOLDS_MANUALLY = true;
					MANUAL_THRE_CHECKER = true;
				}
				else if(setting == "0"){
					CHOOSE_THRESHOLDS_MANUALLY = false;
					MANUAL_THRE_CHECKER = true;
				}
				else{
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"CHOOSE_THRESHOLDS_MANUALLY\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SET_SCALE_BEFORE_ANALYSIS=).*")){
				setting = replace(ini_array[i], "SET_SCALE_BEFORE_ANALYSIS=", "");
				if(setting == "1"){
					SET_SCALE = true;
					SET_SCALE_CHECKER = true;
				}
				else if(setting == "0"){
					SET_SCALE = false;
					SET_SCALE_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SET_SCALE_BEFORE_ANALYSIS\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SCALE=).*")){
				setting = replace(ini_array[i], "SCALE=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && PERFORM_ANALYSIS){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SCALE\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					scale = parseFloat(setting);
					SCALE_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(UNIT).*")){
				setting = replace(ini_array[i], "UNIT=", "");
				unit = setting;
				UNIT_CHECKER = true;
				
				continue;
			}
			if(matches(ini_array[i], "^(BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD=).*")){
				setting = replace(ini_array[i], "BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && (PERFORM_ANALYSIS ||PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD = parseFloat(setting);
					BACK_LOW_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD=).*")){
				setting = replace(ini_array[i], "BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && (PERFORM_ANALYSIS ||PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD = parseFloat(setting);
					BACK_UP_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD=).*")){
				setting = replace(ini_array[i], "PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && (PERFORM_ANALYSIS ||PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD = parseFloat(setting);
					PARE_LOW_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD=).*")){
				setting = replace(ini_array[i], "PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && (PERFORM_ANALYSIS ||PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD = parseFloat(setting);
					PARE_UP_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD=).*")){
				setting = replace(ini_array[i], "COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && (PERFORM_ANALYSIS ||PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD = parseFloat(setting);
					COLL_LOW_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD=).*")){
				setting = replace(ini_array[i], "COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD=", "");
				if((!matches(setting, "^[0-9.]*$") || setting == "") && (PERFORM_ANALYSIS ||PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				else{
					COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD = parseFloat(setting);
					COLL_UP_CHECKER = true;
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_IMAGE_WITH_WHITENED_BACKGROUND=).*")){
				setting = replace(ini_array[i], "SAVE_IMAGE_WITH_WHITENED_BACKGROUND=", "");
				if(setting == "1"){
					SAVE_WHITENING = true;
					WHITEN_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_WHITENING = false;
					WHITEN_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_IMAGE_WITH_WHITENED_BACKGROUND\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_RSL_SKETCH=).*")){
				setting = replace(ini_array[i], "SAVE_RSL_SKETCH=", "");
				if(setting == "1"){
					SAVE_RSL_SKETCH = true;
					RSL_SKETCH_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_RSL_SKETCH = false;
					RSL_SKETCH_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_RSL_SKETCH\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_RSL_OVERLAY=).*")){
				setting = replace(ini_array[i], "SAVE_RSL_OVERLAY=", "");
				if(setting == "1"){
					SAVE_RSL_OVERLAY = true;
					RSL_OVER_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_RSL_OVERLAY = false;
					RSL_OVER_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_RSL_OVERLAY\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_RSL_STACK=).*")){
				setting = replace(ini_array[i], "SAVE_RSL_STACK=", "");
				if(setting == "1"){
					SAVE_RSL_STACK = true;
					RSL_STACK_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_RSL_STACK = false;
					RSL_STACK_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_RSL_STACK\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_STRATA_SKETCH=).*")){
				setting = replace(ini_array[i], "SAVE_STRATA_SKETCH=", "");
				if(setting == "1"){
					SAVE_STRATA_SKETCH = true;
					STRATA_SKETCH_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_STRATA_SKETCH = false;
					STRATA_SKETCH_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_STRATA_SKETCH\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_STRATA_OVERLAY=).*")){
				setting = replace(ini_array[i], "SAVE_STRATA_OVERLAY=", "");
				if(setting == "1"){
					SAVE_STRATA_OVERLAY = true;
					STRATA_OVER_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_STRATA_OVERLAY = false;
					STRATA_OVER_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_STRATA_OVERLAY\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_STRATA_STACK=).*")){
				setting = replace(ini_array[i], "SAVE_STRATA_STACK=", "");
				if(setting == "1"){
					SAVE_STRATA_STACK = true;
					STRATA_STACK_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_STRATA_STACK = false;
					STRATA_STACK_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_STRATA_STACK\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_COMBINATION_SKETCH=).*")){
				setting = replace(ini_array[i], "SAVE_COMBINATION_SKETCH=", "");
				if(setting == "1"){
					SAVE_COMBINATION_SKETCH = true;
					COMBINATION_SKETCH_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_COMBINATION_SKETCH = false;
					COMBINATION_SKETCH_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_COMBINATION_SKETCH\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_COMBINATION_OVERLAY=).*")){
				setting = replace(ini_array[i], "SAVE_COMBINATION_OVERLAY=", "");
				if(setting == "1"){
					SAVE_COMBINATION_OVERLAY = true;
					COMB_OVER_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_COMBINATION_OVERLAY = false;
					COMB_OVER_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_COMBINATION_OVERLAY\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_COMBINATION_STACK=).*")){
				setting = replace(ini_array[i], "SAVE_COMBINATION_STACK=", "");
				if(setting == "1"){
					SAVE_COMBINATION_STACK = true;
					COMB_STACK_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_COMBINATION_STACK = false;
					COMB_STACK_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_COMBINATION_STACK\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_ROIS_AS_ZIP=).*")){
				setting = replace(ini_array[i], "SAVE_ROIS_AS_ZIP=", "");
				if(setting == "1"){
					SAVE_ROIS_AS_ZIP = true;
					ROIS_ZIP_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_ROIS_AS_ZIP = false;
					ROIS_ZIP_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && PERFORM_SEGMENTATION){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_ROIS_AS_ZIP\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_FALSECOLOR_AS_TIFF=).*")){
				setting = replace(ini_array[i], "SAVE_FALSECOLOR_AS_TIFF=", "");
				if(setting == "1"){
					SAVE_FALSECOLOR_AS_TIFF = true;
					FALSECOLOR_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_FALSECOLOR_AS_TIFF = false;
					FALSECOLOR_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_FALSECOLOR_AS_TIFF\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_RAW_VALUES_AS_CSV=).*")){
				setting = replace(ini_array[i], "SAVE_RAW_VALUES_AS_CSV=", "");
				if(setting == "1"){
					SAVE_RAW_VALUES_AS_CSV = true;
					RAW_CSV_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_RAW_VALUES_AS_CSV = false;
					RAW_CSV_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_RAW_VALUES_AS_CSV\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_RAW_VALUES_AS_XLSX=).*")){
				setting = replace(ini_array[i], "SAVE_RAW_VALUES_AS_XLSX=", "");
				if(setting == "1"){
					SAVE_RAW_VALUES_AS_XLSX = true;
					RAW_XLSX_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_RAW_VALUES_AS_XLSX = false;
					RAW_XLSX_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_RAW_VALUES_AS_XLSX\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_PROCESSED_RESULTS_AS_CSV=).*")){
				setting = replace(ini_array[i], "SAVE_PROCESSED_RESULTS_AS_CSV=", "");
				if(setting == "1"){
					SAVE_PROCESSED_RESULTS_AS_CSV = true;
					PROC_CSV_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_PROCESSED_RESULTS_AS_CSV = false;
					PROC_CSV_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_PROCESSED_RESULTS_AS_CSV\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
			if(matches(ini_array[i], "^(SAVE_PROCESSED_RESULTS_AS_XLSX=).*")){
				setting = replace(ini_array[i], "SAVE_PROCESSED_RESULTS_AS_XLSX=", "");
				if(setting == "1"){
					SAVE_PROCESSED_RESULTS_AS_XLSX = true;
					PROC_XLSX_CHECKER = true;
				}
				else if(setting == "0"){
					SAVE_PROCESSED_RESULTS_AS_XLSX = false;
					PROC_XLSX_CHECKER = true;
				}
				else if(setting != 0 && setting != 1 && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
					showMessage("Error", ini_file_name+" seems to be corrupted.\nPlease check the line in which \"SAVE_PROCESSED_RESULTS_AS_XLSX\" is set.");
					File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
					exec(ini_dir+"createdByPSRSegmentation.bat");
					exit();
				}
				continue;
			}
		}
		
		//Check if all parameters have been initialized. This is all very elegant code that wasn't tedious to write at all and I'm very proud of it. 
		if(PERF_SEGM_CHECKER == false){
			showMessage("Error", "No value for \"PERFORM_SEGMENTATION\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(PERF_ANALYSIS_CHECKER == false){
			showMessage("Error", "No value for \"PERFORM_ANALYSIS\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(PERF_ANALYSIS_WO_SEGM_CHECKER == false){
			showMessage("Error", "No value for \"PERFORM_ANALYSIS_WITHOUT_SEGMENTATION\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(RSL_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"DIFFERENTIATE_RSL\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(STRATA_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"DIFFERENTIATE_STRATA\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(COMB_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"DIFFERENTIATE_COMBINATION\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(MIN_HEART_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"MINIMUM_HEART_AREA\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(MIN_VENT_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"MINIMUM_VENTRICLE_AREA\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(MAX_VENT_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"MAXIMUM_VENTRICLE_AREA\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(EPI_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"EPICARDIAL_THICKNESS\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(ENDO_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"ENDOCARDIAL_THICKNESS\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(SUBEND_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SUBENDOCARDIAL_THICKNESS\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(SUBEPI_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SUBEPICARDIAL_THICKNESS\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(SILH_LOW_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(SILH_UP_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(RV_THR_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"RV_ANGLE_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(LV_DIFF_THR_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"LV_ANGLE_DIFFERENCE_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(LV_CORR_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"LV_ANGLE_CORRECTION_FACTOR\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(HIGH_RES_CHECKER == false){
			showMessage("Error", "No value for \"ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(MANUAL_THRE_CHECKER == false){
			showMessage("Error", "No value for \"CHOOSE_THRESHOLDS_MANUALLY\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(BACK_LOW_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(BACK_UP_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(PARE_LOW_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(PARE_UP_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(COLL_LOW_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(COLL_UP_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(RSL_OVER_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_RSL_OVERLAY\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(RSL_STACK_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_RSL_STACK\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(STRATA_OVER_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_STRATA_OVERLAY\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(STRATA_STACK_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_STRATA_STACK\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(COMB_OVER_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_COMBINATION_OVERLAY\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(COMB_STACK_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_COMBINATION_STACK\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(ROIS_ZIP_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_ROIS_AS_ZIP\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(FALSECOLOR_CHECKER == false && PERFORM_ANALYSIS){
			showMessage("Error", "No value for \"SAVE_FALSECOLOR_AS_TIFF\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(RAW_CSV_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"SAVE_RAW_VALUES_AS_CSV\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(RAW_XLSX_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"SAVE_RAW_VALUES_AS_XLSX\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(PROC_CSV_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"SAVE_PROCESSED_RESULTS_AS_CSV\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(PROC_XLSX_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"SAVE_PROCESSED_RESULTS_AS_XLSX\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(EXCL_PERIV_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"EXCLUDE_PERIVASCULAR_COLLAGEN\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(VASC_THR_CHECKER == false && PERFORM_SEGMENTATION && EXCLUDE_PERIVASCULAR_COLLAGEN){
			showMessage("Error", "No value for \"VASCULAR_RECOGNITION_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(MAX_BLOODV_CHECKER == false && PERFORM_SEGMENTATION && EXCLUDE_PERIVASCULAR_COLLAGEN){
			showMessage("Error", "No value for \"MAXIMUM_BLOOD_VESSEL_AREA\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(MIN_BLOODV_CHECKER == false && PERFORM_SEGMENTATION && EXCLUDE_PERIVASCULAR_COLLAGEN){
			showMessage("Error", "No value for \"MINIMUM_BLOOD_VESSEL_AREA\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(MIN_LUMEN_CHECKER == false && PERFORM_SEGMENTATION && EXCLUDE_PERIVASCULAR_COLLAGEN){
			showMessage("Error", "No value for \"MINIMUM_LUMEN_AREA\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(SET_SCALE_CHECKER == false && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			showMessage("Error", "No value for \"SET_SCALE_BEFORE_ANALYSIS\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(SCALE_CHECKER == false && SET_SCALE){
			showMessage("Error", "No value for \"SCALE\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(UNIT_CHECKER == false && SET_SCALE){
			showMessage("Error", "No value for \"UNIT\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(SWITCH_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SWITCH_VENTRICLES\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(DCR_THRESH_CHECKER == false){
			showMessage("Error", "No value for \"DECREASE_HIGH_RESOLUTION_THRESHOLD\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(DCR_WOH_CHECKER == false){
			showMessage("Error", "No value for \"DECREASE_WIDTH_OR_HEIGHT_TO\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(RSL_SKETCH_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_RSL_SKETCH\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(STRATA_SKETCH_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_STRATA_SKETCH\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(COMBINATION_SKETCH_CHECKER == false && PERFORM_SEGMENTATION){
			showMessage("Error", "No value for \"SAVE_COMBINATION_SKETCH\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(WHITEN_CHECKER == false){
			showMessage("Error", "No value for \"SAVE_IMAGE_WITH_WHITENED_BACKGROUND\" could be found. Please check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(PERFORM_ANALYSIS && PERFORM_ANALYSIS_WITHOUT_SEGMENTATION){
			showMessage("Error", "\"PERFORM_ANALYSIS\" and \"PERFORM_ANALYSIS_WITHOUT_SEGMENTATION\" are mutually exclusive.\nPlease consult the manual and check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		if(!PERFORM_SEGMENTATION && !PERFORM_ANALYSIS && !PERFORM_ANALYSIS_WITHOUT_SEGMENTATION){
			showMessage("Error", "All mode selectors are switched off.\nPlease consult the manual and check "+ini_file_name+".");
			File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
			exec(ini_dir+"createdByPSRSegmentation.bat");
			exit();
		}
		
		run("Clear Results");
		run("Colors...", "selection=black");
		
		while(nImages == 0){
			waitForUser("Error", "No image is open. Please open one and click OK.");
		}
		
		dir = getDirectory("image");
		dir_array = split(dir, "\\");
	
		folder_title = dir_array[dir_array.length-1];
		title = getTitle();
		path = dir+title;

		//Checks whether the compressed image is named correctly.
		if(ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION){
			if(lengthOf(title) == lengthOf(replace(title, "_Scale.jpg", ".tif"))){
				exit("Please note that the low-resolution image's title must end in _Scale.jpg.");
			}
		}
		
		whitened_saved = false;
		warnOverlap = false;
		
		if(PERFORM_SEGMENTATION){
			if(roiManager("count") > 0){
				selectWindow("ROI Manager");
				run("Close");
			}
			ventricles_found = false;
			draw_walls = false;
			draw_ventricle = false;
			SilhSet = false;
			askVentricleSide = false;

			correctCounter = 0;
			
			lessErosion = 0;
			
			while(!ventricles_found){
				showStatus("!Segmentation in progress...");
				if(draw_walls){
					if(thresholdArray.length == 3){
						//print("R: "+thresholdArray[0]+"\nG: "+thresholdArray[1]+"\nB: "+thresholdArray[2]);
						setForegroundColor(thresholdArray[0], thresholdArray[1], thresholdArray[2]);
					}
					else if(thresholdArray.length == 5){
						//print("R: "+thresholdArray[2]+"\nG: "+thresholdArray[3]+"\nB: "+thresholdArray[4]);
						setForegroundColor(thresholdArray[2], thresholdArray[3], thresholdArray[4]);
					}
						
					setTool("Pencil Tool");
					waitForUser("Please adjust pencil width if needed and\ncomplete ventricle walls.");
				}
				if(draw_ventricle){
					setForegroundColor(255,255,255);
					setTool("Pencil Tool");
					waitForUser("Please adjust pencil width if needed and\ncomplete ventricle lumen.");
				}
						
				if(!ventricles_found){
					if(!draw_ventricle && !draw_walls){
						thresholdArray = correctPSRBackground();
						//Array.show("thresholdArray:\n", thresholdArray);
						correctCounter++;
					}
					
					draw_walls = false;
					draw_ventricle = false;
					showStatus("!Segmentation in progress...");

					/*Recognize silhouette of whole section*/
					roiManager("reset");
					title = getTitle();
					
					run("Duplicate...", "title=Silhouette");
					run("HSB Stack");
					run("Stack to Images");
					selectWindow("Hue");
					close();
					selectWindow("Brightness");
					close();
					if(CHOOSE_THRESHOLDS_MANUALLY && !SilhSet){
						run("Threshold...");
						setThreshold(SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD, SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD);
						waitForUser("Please adjust thresholds so that the entire tissue is colored red.\nThe higher number represents \"SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD\", the lower one \"SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD\".");
						getThreshold(SilhLower, SilhUpper);
						if(!File.exists(dir+"Thresholds\\")){
							File.makeDirectory(dir+"Thresholds\\");
						}
						File.saveString(SilhLower+"\n"+SilhUpper, dir+"Thresholds\\"+"SILHOUETTE_IDENTIFICATION.txt");
						SilhSet = true;
					}
					else if(SilhSet){
						setThreshold(SilhLower, SilhUpper);
					}
					else{
						setThreshold(SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD, SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD);
					}
					
					run("Create Mask");
					run("Dilate");
					run("Dilate");
					run("Fill Holes");
					run("Options...", "iterations=3 count=1 do=Erode");
					run("Options...", "iterations=3 count=1 do=Dilate");
					run("Analyze Particles...", "size="+MINIMUM_HEART_AREA+"-Infinity show=Outlines display add");
					
					selectWindow(title);
					getDimensions(width, height, channels, slices, frames);
					close("\\Others");
					
					count = roiManager("count");
					if(count == 0){
						showMessage("Error", "No heart silhouette could be detected.\nPlease check the MINIMUM_HEART_AREA value.");
						exit();
					}
					if(count > 1){
						showMessage("Error", "More than one putative heart silhouette could be detected.");
						exit();
					}
					
					if(SAVE_WHITENING && !whitened_saved && !PERFORM_ANALYSIS){
						//Open high-resolution image
						height1 = height;
						showStatus("!Opening high-resolution image...");
						open(replace(path, "_Scale.jpg", ".tif"));
						getDimensions(width, height, channels, slices, frames);
						height2 = height;
					
						factor = height2 / height1;
					
						if(SET_SCALE){
							if(unit == "µm"){
								unit = fromCharCode(181)+"m";
							}
							run("Set Scale...", "distance="+scale+" known=1 unit="+unit);
						}
						
						showStatus("Resizing...");
						run("Scale...", "x="+1/factor+" y="+1/factor+" interpolation=None average create");
						
						run("Restore Selection");
						setForegroundColor(255,255,255);
						run("Fill", "slice");
						run("Select None");
						
						saveAs("jpeg", dir+folder_title+"_Scale_whitened.jpg");
						close();
						whitened_saved = true;
						selectWindow(title);
					}
					
					//Create new image to draw overlay on
					getDimensions(width, height, channels, slices, frames);
					newImage("Overlay", "RGB white", width, height, 1);
					getDimensions(width, height, channels, slices, frames);
					roiManager("select", 0);
					roiManager("rename", "00-OuterPerimeter");
					run("Enlarge...", "enlarge="+maxOf(width, height)/450);
					roiManager("update");
					
					/*Shrink selection to create epicardial ROI*/
					run("Enlarge...", "enlarge="+EPICARDIAL_THICKNESS*(-1));
					roiManager("add");
					roiManager("select", 1);
					roiManager("rename", "01-ExclEpicardium");
					roiManager("select", newArray(0,1));
					roiManager("xor");
					roiManager("add");
					selectWindow("Overlay");
					roiManager("select", 2);
					roiManager("rename", "02-Epicardium");
					setForegroundColor(255,0,0);
					roiManager("fill");
					run("Select None");
					
					/*Recognize ventricles*/
					selectWindow(title);
					run("Duplicate...", "title=Ventricles");
					run("HSB Stack");
					run("Stack to Images");
					selectWindow("Hue");
					close();
					selectWindow("Brightness");
					close();
					
					if(CHOOSE_THRESHOLDS_MANUALLY){
						setThreshold(SilhLower, SilhUpper);
					}
					else{
						setThreshold(SILHOUETTE_IDENTIFICATION_LOWER_THRESHOLD, SILHOUETTE_IDENTIFICATION_UPPER_THRESHOLD);
					}
					
					run("Create Mask");
					
					run("Invert");
					erosionIteration = 3-lessErosion;
					dilationIteration = 2+lessErosion;
					
					if(erosionIteration < 0)
						erosionIteration = 0;
					if(dilationIteration < 0)
						dilationIteration = 0;
						
					run("Options...", "iterations="+erosionIteration+" count=1 do=Erode");
					run("Options...", "iterations="+dilationIteration+" count=1 do=Dilate");
					
					number1 = roiManager("count");
					run("Analyze Particles...", "size="+MINIMUM_VENTRICLE_AREA+"-"+MAXIMUM_VENTRICLE_AREA+" add");
					number2 = roiManager("count");
				
					run("Analyze Particles...", "size="+MINIMUM_VENTRICLE_AREA+"-1000000000 show=[Count Masks]");
					selectWindow("Saturation");
					close();
					selectWindow("mask");
					close();
					selectWindow("Count Masks of mask");
					run("Enhance Contrast", "saturated=0.35");
					run("8-bit");
					run("6_shades");
					
					for(i=number1; i<number2; i++){
						roiManager("deselect");
						roiManager("select", i);
						if(i<10)
							roiManager("rename", "0"+i+"-candidate-"+i-number1+1);
						else 
							roiManager("rename", i+"-candidate-"+i-number1+1);
							
						roiManager("deselect");
						roiManager("Show None");
					}
					
					count = roiManager("count");
				
					if(count == 5 || ventricles_found){
						ventricles_found = true;
						/*getDimensions(width, height, channels, slices, frames);
						setFont("SansSerif", maxOf(width, height)/10);
						textCounter = 4;
						startTime = getTime();
						while(textCounter > 0){
							currentTime = getTime();
							//print(currentTime - startTime);
							if(currentTime - startTime >= 1000){
								run("Select None");
								makeText(toString(textCounter-1), width*0.1, height*0.75);
								run("Properties... ", "  fill=black");
								textCounter--;
								startTime = currentTime;
							}
							if(isKeyDown("shift")){
								ventricles_found = false;
								count = 4;
								break;
							}*/
							//wait(2000);
						}
						run("Select None");
						if(ventricles_found){
							getDimensions(width, height, channels, slices, frames);
							/*setFont("SansSerif", maxOf(width, height)/10);
							for(i=3; i>=1; i--){
								makeText(toString(i), width*0.1, height*0.75);
								run("Properties... ", "  fill=black");
							}*/
							
							selectWindow("Overlay");
							roiManager("select", 3);
							roiManager("rename", "03-Ventricle1");
							setForegroundColor(255,255,255);
							roiManager("fill");
							roiManager("select", 4);
							roiManager("rename", "04-Ventricle2");
							setForegroundColor(255,255,255);
							roiManager("fill");
						}
					}
					if(count < 5){
						Dialog.create("Error");
						Dialog.addMessage("Either only one or no ventricle candidate could be identified.\nHow do you wish to continue?");
						items = newArray("Draw to complete non-continuous ventricle walls", "Draw freehand selection representing the missing ventricle(s)", "Try again with temporarily reduced MINIMUM_VENTRICLE_AREA value", "Recheck parameters in "+ini_file_name+".", "Try again with changed processing");
						Dialog.addRadioButtonGroup("", items, 5, 1, "Draw to complete non-continuous ventricle walls");
						Dialog.show();
						choice = Dialog.getRadioButton();
						
						if(choice == "Try again with changed processing"){
							selectWindow(title);
							close("\\Others");
							lessErosion++;
						}
						else if(choice == "Draw freehand selection representing the missing ventricle(s)"){
							setTool(3);
							run("Colors...", "selection=black");
							selectWindow("Count Masks of mask");
							close();
							selectWindow(title);
							run("Select None");
							
							number1 = roiManager("count");
							waitForUser("Please trace the unrecognized ventricle and press OK.\nIf two ventricles need to be drawn, press 't' after the first one to save it.");
							roiManager("add");
							number2 = roiManager("count");
											
							for(i=number1; i<number2; i++){
								roiManager("deselect");
								roiManager("select", i);
								roiManager("rename", "candidate-user"+i-number1+1);
								roiManager("deselect");
								roiManager("Show None");
							}
							if(roiManager("count") == 5){
								ventricles_found = true;
							}
							else if(roiManager("count") > 5){
								showMessage("Error", "Now, there are too many candidates. Make sure that only two candidates are present.");
								selectWindow(title);
								close("\\Others");
							}
							else{
								showMessage("Error", "The number of ROIs is too low. Exactly five are required.");
								selectWindow(title);
								close("\\Others");
							}
						}
						else if(choice == "Recheck parameters in "+ini_file_name+"."){
							run("Close All");
							File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
							exec(ini_dir+"createdByPSRSegmentation.bat");
							exit();
						}
						else if(choice == "Draw to complete non-continuous ventricle walls"){
							draw_walls = true;
							selectWindow(title);
							close("\\Others");
						}
						else if(choice == "Try again with temporarily reduced MINIMUM_VENTRICLE_AREA value"){
							selectWindow(title);
							close("\\Others");
							MINIMUM_VENTRICLE_AREA -= 10000;
						}
					}	
					else if(count > 5){
						Dialog.create("Error");
						Dialog.addMessage("More than two ventricle candidates could be identified.\nHow do you wish to continue?");
						items = newArray("Try again with changed processing", "Exclude wrongly detected candidate in ROI manager manually","Draw to connect bisected ventricle sections", "Try again with temporarily increased MINIMUM_VENTRICLE_AREA value", "Recheck parameters in "+ini_file_name+".");
						Dialog.addRadioButtonGroup("", items, 5, 1, "Try again with changed processing");
						Dialog.show();
						choice = Dialog.getRadioButton();
						
						if(choice == "Try again with changed processing"){
							selectWindow(title);
							close("\\Others");
							lessErosion--;
						}
						else if(choice == "Exclude wrongly detected candidate in ROI manager manually"){
							selectArray = Array.getSequence(roiManager("count"));
							roiManager("select", selectArray);
							roiManager("Set Fill Color", "white");
							roiManager("deselect");
							
							selectWindow("ROI Manager");
							waitForUser("Please review ROIs named \"candidate-...\"\nand delete those which are not ventricles.");
							
							if(roiManager("count") == 5){
								ventricles_found = true;
							}
							
							while(roiManager("count") > 5){
								showMessage("Error", "There are still too many candidates. After deleting, only two may remain.");
								selectWindow("ROI Manager");
								waitForUser("Please review ROIs named \"candidate-...\"\nand delete those which are not ventricles.");
							}
							if(roiManager("count") == 5){
								ventricles_found = true;
							}
							else if(roiManager("count") == 4){
								showMessage("Error", "Only one candidate remains. Please try again.");
								selectWindow(title);
								close("\\Others");
							}
							else{
								showMessage("Error", "The number of ROIs is three or lower. Exactly five are required.");
								selectWindow(title);
								close("\\Others");
							}
						}
						else if(choice == "Recheck parameters in "+ini_file_name+"."){
							run("Close All");
							File.saveString(cmd_command, ini_dir+"createdByPSRSegmentation.bat");
							exec(ini_dir+"createdByPSRSegmentation.bat");
							exit();
						}
						else if(choice == "Draw to connect bisected ventricle sections"){
							draw_ventricle = true;
							selectWindow(title);
							close("\\Others");
						}
						else if(choice == "Try again with temporarily increased MINIMUM_VENTRICLE_AREA value"){
							selectWindow(title);
							close("\\Others");
							MINIMUM_VENTRICLE_AREA += 10000;
						}
				}
			}	
			
			showStatus("!Segmentation in progress...");
			
			roiManager("sort");
			roiManager("select", 3);
			roiManager("rename", "03-candidate-1");
			roiManager("deselect");
			roiManager("select", 4);
			roiManager("rename", "04-candidate-2");
			roiManager("deselect");

			//Construct lines measuring wall thickness
			if(isOpen("Count Masks of mask")){
				selectWindow("Count Masks of mask");
				close();
			}
			selectWindow(title);
			run("Select None");
			run("Set Measurements...", "bounding redirect=None decimal=3");
			run("Clear Results");
			
			roiManager("select", 3);
			run("Measure");
			roiManager("select", 4);
			run("Measure");
			
			bx1 = getResult("BX", 0);
			by1 = getResult("BY", 0);
			bx2 = getResult("BX", 1);
			by2 = getResult("BY", 1);
			width1 = getResult("Width", 0);
			height1 = getResult("Height", 0);
			width2 = getResult("Width", 1);
			height2 = getResult("Height", 1);
			
			//Calculate centers of bounding rectangles
			c1x = bx1 + width1/2;
			c1y = by1 + height1/2;
			c2x = bx2 + width2/2;
			c2y = by2 + height2/2;
			
			setForegroundColor(255,0,0);
			setLineWidth(5);
			//fillOval(c1x-10, c1y-10, 20, 20);
			//drawRect(bx1, by1, width1, height1);
			
			setForegroundColor(0,0,255);
			//fillOval(c2x-10, c2y-10, 20, 20);
			//drawRect(bx2, by2, width2, height2);
			
			angle = getAngleProper(c1x, c1y, c2x, c2y);
			
			getDimensions(width, height, channels, slices, frames);
			diameter = 1.5*sqrt(width*width + height*height);
			
			//Construct line from image margin to image margin crossing both bounding rectangle centers
			setForegroundColor(0,0,0);
			
			outerPoint1 = getPointOnLineFromX1(c1x, c1y, angle, diameter, 1, false);
			outerPoint2 = getPointOnLineFromX1(c2x, c2y, angle, diameter*(-1), 1, false);
			
			line3 = newArray(outerPoint1[0], outerPoint1[1], outerPoint2[0], outerPoint2[1]);
			//drawLine(line3[0], line3[1], line3[2], line3[3]);
			
			getDimensions(width, height, channels, slices, frames);
			
			//Find points at which line intersects image margins
			marginIntersection1 = getIntersectionPoint(line3[0], line3[1], line3[2], line3[3], 0, height, width, height); //lower
			marginIntersection2 = getIntersectionPoint(line3[0], line3[1], line3[2], line3[3], 0, 0, width, 0); //upper
			marginIntersection3 = getIntersectionPoint(line3[0], line3[1], line3[2], line3[3], 0, 0, 0, height); //left
			marginIntersection4 = getIntersectionPoint(line3[0], line3[1], line3[2], line3[3], width, 0, width, height); //right
			
			/*print(marginIntersection1[0]+", "+marginIntersection1[1]);
			print(marginIntersection2[0]+", "+marginIntersection2[1]);
			print(marginIntersection3[0]+", "+marginIntersection3[1]);
			print(marginIntersection4[0]+", "+marginIntersection4[1]);*/
			
			marginIntersectionArray = newArray();
			
			if(isPointWithinImageBoundaries(round(marginIntersection1[0]), round(marginIntersection1[1]))){
				marginIntersectionArray[marginIntersectionArray.length] = marginIntersection1[0];
				marginIntersectionArray[marginIntersectionArray.length] = marginIntersection1[1];
			}
			if(isPointWithinImageBoundaries(round(marginIntersection2[0]), round(marginIntersection2[1]))){
				marginIntersectionArray[marginIntersectionArray.length] = marginIntersection2[0];
				marginIntersectionArray[marginIntersectionArray.length] = marginIntersection2[1];
			}
			if(isPointWithinImageBoundaries(round(marginIntersection3[0]), round(marginIntersection3[1]))){
				marginIntersectionArray[marginIntersectionArray.length] = marginIntersection3[0];
				marginIntersectionArray[marginIntersectionArray.length] = marginIntersection3[1];
			}
			if(isPointWithinImageBoundaries(round(marginIntersection4[0]), round(marginIntersection4[1]))){
				marginIntersectionArray[marginIntersectionArray.length] = marginIntersection4[0];
				marginIntersectionArray[marginIntersectionArray.length] = marginIntersection4[1];
			}
			
			//print(marginIntersectionArray[0]+", "+marginIntersectionArray[1]+" | "+marginIntersectionArray[2]+", "+marginIntersectionArray[3]+"\n");
			
			//Find points at which line from code block above intersects rectangle boundaries
			rectangle1IntersectionArray = newArray();
			rectangle2IntersectionArray = newArray();
			
			rectangle1IntersectionPoint1 = getIntersectionPoint(marginIntersectionArray[0], marginIntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3], bx1, by1, bx1+width1, by1);
			rectangle1IntersectionPoint2 = getIntersectionPoint(marginIntersectionArray[0], marginIntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3], bx1+width1, by1, bx1+width1, by1+height1);
			rectangle1IntersectionPoint3 = getIntersectionPoint(marginIntersectionArray[0], marginIntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3], bx1, by1+height1, bx1+width1, by1+height1);
			rectangle1IntersectionPoint4 = getIntersectionPoint(marginIntersectionArray[0], marginIntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3], bx1, by1, bx1, by1+height1);
			
			rectangle2IntersectionPoint1 = getIntersectionPoint(marginIntersectionArray[0], marginIntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3], bx2, by2, bx2+width2, by2);
			rectangle2IntersectionPoint2 = getIntersectionPoint(marginIntersectionArray[0], marginIntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3], bx2+width2, by2, bx2+width2, by2+height2);
			rectangle2IntersectionPoint3 = getIntersectionPoint(marginIntersectionArray[0], marginIntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3], bx2, by2+height2, bx2+width2, by2+height2);
			rectangle2IntersectionPoint4 = getIntersectionPoint(marginIntersectionArray[0], marginIntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3], bx2, by2, bx2, by2+height2);
			
			/*print(rectangle1IntersectionPoint1[0]+", "+rectangle1IntersectionPoint1[1]);
			print(rectangle1IntersectionPoint2[0]+", "+rectangle1IntersectionPoint2[1]);
			print(rectangle1IntersectionPoint3[0]+", "+rectangle1IntersectionPoint3[1]);
			print(rectangle1IntersectionPoint4[0]+", "+rectangle1IntersectionPoint4[1]);
			
			print(rectangle2IntersectionPoint1[0]+", "+rectangle2IntersectionPoint1[1]);
			print(rectangle2IntersectionPoint2[0]+", "+rectangle2IntersectionPoint2[1]);
			print(rectangle2IntersectionPoint3[0]+", "+rectangle2IntersectionPoint3[1]);
			print(rectangle2IntersectionPoint4[0]+", "+rectangle2IntersectionPoint4[1]);*/
			
			//Select points that are within the picture boundaries and at the same time within the constraints of the respective bounding rectangle (2 per rectangle, 1 is an edge case, >2 is impossible)
			if(isPointWithinImageBoundaries(rectangle1IntersectionPoint1[0], rectangle1IntersectionPoint1[1]) && rectangle1IntersectionPoint1[0] >= bx1 && rectangle1IntersectionPoint1[0] <= bx1+width1){
				rectangle1IntersectionArray[rectangle1IntersectionArray.length] = rectangle1IntersectionPoint1[0];
				rectangle1IntersectionArray[rectangle1IntersectionArray.length] = rectangle1IntersectionPoint1[1];
			}
			if(isPointWithinImageBoundaries(rectangle1IntersectionPoint2[0], rectangle1IntersectionPoint2[1]) && rectangle1IntersectionPoint2[1] >= by1 && rectangle1IntersectionPoint2[1] <= by1+height1){
				rectangle1IntersectionArray[rectangle1IntersectionArray.length] = rectangle1IntersectionPoint2[0];
				rectangle1IntersectionArray[rectangle1IntersectionArray.length] = rectangle1IntersectionPoint2[1];
			}
			if(isPointWithinImageBoundaries(rectangle1IntersectionPoint3[0], rectangle1IntersectionPoint3[1]) && rectangle1IntersectionPoint3[0] >= bx1 && rectangle1IntersectionPoint3[0] <= bx1+width1){
				rectangle1IntersectionArray[rectangle1IntersectionArray.length] = rectangle1IntersectionPoint3[0];
				rectangle1IntersectionArray[rectangle1IntersectionArray.length] = rectangle1IntersectionPoint3[1];
			}
			if(isPointWithinImageBoundaries(rectangle1IntersectionPoint4[0], rectangle1IntersectionPoint4[1]) && rectangle1IntersectionPoint4[1] >= by1 && rectangle1IntersectionPoint4[1] <= by1+height1){
				rectangle1IntersectionArray[rectangle1IntersectionArray.length] = rectangle1IntersectionPoint4[0];
				rectangle1IntersectionArray[rectangle1IntersectionArray.length] = rectangle1IntersectionPoint4[1];
			}
			
			if(isPointWithinImageBoundaries(rectangle2IntersectionPoint1[0], rectangle2IntersectionPoint1[1]) && rectangle2IntersectionPoint1[0] >= bx2 && rectangle2IntersectionPoint1[0] <= bx2+width2){
				rectangle2IntersectionArray[rectangle2IntersectionArray.length] = rectangle2IntersectionPoint1[0];
				rectangle2IntersectionArray[rectangle2IntersectionArray.length] = rectangle2IntersectionPoint1[1];
			}
			if(isPointWithinImageBoundaries(rectangle2IntersectionPoint2[0], rectangle2IntersectionPoint2[1]) && rectangle2IntersectionPoint2[1] >= by2 && rectangle2IntersectionPoint2[1] <= by2+height2){
				rectangle2IntersectionArray[rectangle2IntersectionArray.length] = rectangle2IntersectionPoint2[0];
				rectangle2IntersectionArray[rectangle2IntersectionArray.length] = rectangle2IntersectionPoint2[1];
			}
			if(isPointWithinImageBoundaries(rectangle2IntersectionPoint3[0], rectangle2IntersectionPoint3[1]) && rectangle2IntersectionPoint3[0] >= bx2 && rectangle2IntersectionPoint3[0] <= bx2+width2){
				rectangle2IntersectionArray[rectangle2IntersectionArray.length] = rectangle2IntersectionPoint3[0];
				rectangle2IntersectionArray[rectangle2IntersectionArray.length] = rectangle2IntersectionPoint3[1];
			}
			if(isPointWithinImageBoundaries(rectangle2IntersectionPoint4[0], rectangle2IntersectionPoint4[1]) && rectangle2IntersectionPoint4[1] >= by2 && rectangle2IntersectionPoint4[1] <= by2+height2){
				rectangle2IntersectionArray[rectangle2IntersectionArray.length] = rectangle2IntersectionPoint4[0];
				rectangle2IntersectionArray[rectangle2IntersectionArray.length] = rectangle2IntersectionPoint4[1];
			}
			
			//Array.show(rectangle1IntersectionArray);
			//Array.show(rectangle2IntersectionArray);
			
			//Determine distances from points to second margin intersection
			rectangle1Distance1 = getPointDistance(rectangle1IntersectionArray[0], rectangle1IntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3]);
			rectangle1Distance2 = getPointDistance(rectangle1IntersectionArray[2], rectangle1IntersectionArray[3], marginIntersectionArray[2], marginIntersectionArray[3]);
			rectangle2Distance1 = getPointDistance(rectangle2IntersectionArray[0], rectangle2IntersectionArray[1], marginIntersectionArray[2], marginIntersectionArray[3]);
			rectangle2Distance2 = getPointDistance(rectangle2IntersectionArray[2], rectangle2IntersectionArray[3], marginIntersectionArray[2], marginIntersectionArray[3]);
			center1Distance = getPointDistance(c1x, c1y, marginIntersectionArray[2], marginIntersectionArray[3]);
			center2Distance = getPointDistance(c2x, c2y, marginIntersectionArray[2], marginIntersectionArray[3]);
			
			/*print(rectangle1Distance1);
			print(rectangle1Distance2);
			print(rectangle2Distance1);
			print(rectangle2Distance2+"\n");
			print(center1Distance);
			print(center2Distance+"\n");*/
			
			if(rectangle2Distance1 < rectangle1Distance1 && rectangle2Distance2 < rectangle1Distance2){
				/*print("Good Arrangement 1");
				if(center1Distance < center2Distance){
					print("Attention!");
				}*/
			}
			else if(rectangle2Distance1 > rectangle1Distance1 && rectangle2Distance2 > rectangle1Distance2){
				/*print("Good Arrangement 2");
				if(center1Distance > center2Distance){
					print("Attention!");
				}*/
			}
			else{
				askVentricleSide = true;
			}
			
			getDimensions(width, height, channels, slices, frames);	
				
			//Determine which coordinates are closer to the center of the image
			distance1 = sqrt((c1x-(width/2))*(c1x-(width/2))+(c1y-(height/2))*(c1y-(height/2)));
			distance2 = sqrt((c2x-(width/2))*(c2x-(width/2))+(c2y-(height/2))*(c2y-(height/2)));
			
			if(minOf(distance1, distance2) == distance1){
				orx = c1x;
				ory = c1y;
			}
			else{
				orx = c2x;
				ory = c2y;
			}
			
			//Create silhouette to obtain a clear line profile
			newImage("RL", "8-bit", width, height, 1);
			roiManager("select", 0);
			setForegroundColor(0,0,0);
			run("Fill", "slice");
			
			//Insert ventricles as simplified ellipses
			run("Set Measurements...", "centroid fit redirect=None decimal=3");
			setForegroundColor(255,255,255);
			run("Clear Results");
			
			roiManager("select", 3);
			run("Measure");
			major = getResult("Major", 0);
			minor = getResult("Minor", 0);
			centroidX = getResult("X", 0);
			centroidY = getResult("Y", 0);
			angle = getResult("Angle", 0);
			run("Clear Results");
			
			constructEllipse(major, minor, angle, centroidX, centroidY);
			roiManager("add");
			roiManager("select", 5);
			roiManager("rename", "05-tempEllipse_1");
			run("Fill", "slice");
			
			roiManager("deselect");
			roiManager("select", 4);
			run("Measure");
			
			major = getResult("Major", 0);
			minor = getResult("Minor", 0);
			centroidX = getResult("X", 0);
			centroidY = getResult("Y", 0);
			angle = getResult("Angle", 0);
			run("Clear Results");
			
			constructEllipse(major, minor, angle, centroidX, centroidY);
			roiManager("add");
			roiManager("select", 6);
			roiManager("rename", "06-tempEllipse_2");
			run("Fill", "slice");
			run("Select None");
			roiManager("deselect");
			
			roiManager("sort");
			if(getROIOverlapDegree(5, 6) > 0){
				indexArray = newArray(5, 6);
				roiManager("select", indexArray);
				roiManager("and");
				roiManager("add");
				roiManager("select", 7);
				roiManager("rename", "07-EllipseOverlap");
												
				setForegroundColor(0,0,0);
				run("Fill", "slice");
				
				roiManager("deselect");
				
				indexArray = newArray(5, 6, 7);
				roiManager("select", indexArray);
				roiManager("delete");
				roiManager("deselect");
			}
			else{
				indexArray = newArray(5,6);
				roiManager("select", indexArray);
				roiManager("delete");
				roiManager("deselect");
			}
			
			roiManager("sort");
			run("Select None");
			run("Invert");
			
			//Construct ventricle bisectors to create line profiles
			sumArray = newArray(0, 0, 0, 0, 0, 0, 0);
			meanArray = newArray();
			n = 0;
			
			for(a=-5; a<=5; a++){
				seriesArray = newArray();
				run("Select None");
				angle = getAngle(c1x, c1y, c2x, c2y);
				makeLineAngle(orx, ory, angle+a*2, diameter, false, 0);

				lineProfile = getProfile();
	
				//Normalize array
				for(i=0; i<lineProfile.length; i++){
					lineProfile[i] = lineProfile[i]/255;
				}
				for(i=0; i<lineProfile.length; i++){
					if(lineProfile[i] > 0)
						lineProfile[i] = 1;
				}
				counter = 1;
				
				//Convert to serialized array
				for(i=0; i<lineProfile.length-1; i++){
					if(i == lineProfile.length-2){
						seriesArray[seriesArray.length] = toString(counter)+"*"+lineProfile[i];
					}
					else if(lineProfile[i] == lineProfile[i+1]){
						counter++;
					}
					else if(lineProfile[i] != lineProfile[i+1]){
						seriesArray[seriesArray.length] = toString(counter)+"*"+lineProfile[i];
						counter = 1;
					}
				}
				
				truncateArray = newArray();
				
				//Check if correct sequence of values is present, and form the mean of legal angles
				for(j=0; j<seriesArray.length; j++){
					string = seriesArray[j];
					l = lengthOf(string);
					
					truncateArray[j] = substring(string, l-1, l);
				}
				if(truncateArray.length == 7){
					if(truncateArray[0] == "0" && truncateArray[1] == "1" && truncateArray[2] == "0" && truncateArray[3] == "1" && truncateArray[4] == "0" && truncateArray[5] == "1" && truncateArray[6] == "0"){
						n++;
						for(k=0; k<truncateArray.length; k++){
							sumArray[k] = sumArray[k] + parseInt(substring(seriesArray[k], 0, lengthOf(seriesArray[k])-2)); 
						}
					}
				}
			}
			
			for(i=0; i<sumArray.length; i++){
				meanArray[i] = sumArray[i]/n;
			}
						
			//Check which ventricle wall is thinner and allocate RV to it (LV to the other)
			RVWallLine = minOf(meanArray[1], meanArray[5]);
			RVWallIndex = getArrayIndex(meanArray, RVWallLine);
			RVWallSegment = 0;
			LVWallLine = maxOf(meanArray[1], meanArray[5]);
			LVWallIndex = getArrayIndex(meanArray, LVWallLine);
			LVWallSegment = 0;
			
			//Calculate the line segments of the ventricle walls (% of line length from x1y1 to x2y2)
			for(r=RVWallIndex-1; r>=0; r--){
				RVWallSegment += meanArray[r];
			}
			
			for(l=LVWallIndex-1; l>=0; l--){
				LVWallSegment += meanArray[l];
			}
			
			RVWallSegment = RVWallSegment/summarizeArray(meanArray);
			LVWallSegment = LVWallSegment/summarizeArray(meanArray);
			
			makeLineAngle(orx, ory, angle, diameter, true, 10);
			
			RVBeginPoint = getPointOnLineFromOrigin(orx, ory, angle, diameter, RVWallSegment, true);
			LVBeginPoint = getPointOnLineFromOrigin(orx, ory, angle, diameter, LVWallSegment, false);
			
			RVDistance1 = getPointDistance(RVBeginPoint[0], RVBeginPoint[1], c1x, c1y);
			RVDistance2 = getPointDistance(RVBeginPoint[0], RVBeginPoint[1], c2x, c2y);
			LVDistance1 = getPointDistance(RVBeginPoint[0], LVBeginPoint[1], c1x, c1y);
			LVDistance2 = getPointDistance(RVBeginPoint[0], LVBeginPoint[1], c2x, c2y);
				
			if((RVDistance1 < RVDistance2 && !SWITCH_VENTRICLES) || (RVDistance1 > RVDistance2 && SWITCH_VENTRICLES)){
				roiManager("select", 3);
				roiManager("rename", "03-Right Ventricle");
				RVIndex = 3;
				roiManager("select", 4);
				roiManager("rename", "04-Left Ventricle");
				LVIndex = 4;
			}
			else if((RVDistance1 < RVDistance2 && SWITCH_VENTRICLES) || (RVDistance1 > RVDistance2 && !SWITCH_VENTRICLES)){
				roiManager("select", 4);
				roiManager("rename", "03-Right Ventricle");
				RVIndex = 3;
				roiManager("select", 3);
				roiManager("rename", "04-Left Ventricle");
				LVIndex = 4;
			}
			
			if(askVentricleSide){
				selectArray = Array.getSequence(roiManager("count"));
				roiManager("select", selectArray);
				roiManager("Set Fill Color", "magenta");
				roiManager("deselect");
				selectWindow(title);
				waitForUser("Attention", "The arrangement of the ventricles causes the macro to be unable to determine\nautomatically, which ventricle is which. Please refer to the ROI Manager now and\nreview if the ventricles have been assigned correctly. Then, press OK and proceed to the\nnext dialogue.");
				
				Dialog.create("Attention");
				Dialog.addMessage("If ventricles are assigned correctly, please set the option to\n\"Keep\" in this dialogue. Otherwise, set it to \"Switch\".");
				items = newArray("Keep", "Switch");
				Dialog.addRadioButtonGroup("", items, 1, 2, "Keep");
				
				Dialog.show();
				
				choice3 = Dialog.getRadioButton();
				
				if(choice3 == "Switch"){
					roiManager("select", 3);
					roiManager("rename", "04-LeftVentricle");
					roiManager("select", 4);
					roiManager("rename", "03-RightVentricle");
					roiManager("deselect");
					roiManager("sort");
				}
				
				selectArray = Array.getSequence(roiManager("count"));
				roiManager("select", selectArray);
				roiManager("Set Fill Color", "None");
				roiManager("deselect");
			}
			
			roiManager("sort");
			selectWindow("RL");
			close();
			selectWindow("Overlay");
			
			//Mark Ventricles in the Overlay view
			run("Set Measurements...", "centroid redirect=None decimal=3");
			run("Clear Results");
			roiManager("select", RVIndex);
			run("Measure");
			roiManager("select", LVIndex);
			run("Measure");
			
			rx = getResult("X", 0);
			ry = getResult("Y", 0);
			lx = getResult("X", 1);
			ly = getResult("Y", 1);
			
			/*Shrink selection to create right ventricle endocardial ROI*/
			run("Clear Results");
			roiManager("select", RVIndex);
			//run("Enlarge...", "enlarge=-7");
			//roiManager("update");
			run("Enlarge...", "enlarge="+ENDOCARDIAL_THICKNESS);
			roiManager("add");
			roiManager("select", 5);
			roiManager("rename", "05-RVExcl");
			roiManager("select", newArray(3,5));
			roiManager("xor");
			roiManager("add");
			roiManager("select", 6);
			roiManager("rename", "06-RVEndocardium");
			setForegroundColor(255,0,0);
			roiManager("fill");
			
			/*Shrink selection to create left ventricle endocardial ROI*/
			roiManager("select", LVIndex);
			//run("Enlarge...", "enlarge=-7");
			//roiManager("update");
			run("Enlarge...", "enlarge="+ENDOCARDIAL_THICKNESS);
			roiManager("add");
			roiManager("select", 7);
			roiManager("rename", "07-LVExcl");
			roiManager("select", newArray(4,7));
			roiManager("xor");
			roiManager("add");
			roiManager("select", 8);
			roiManager("rename", "08-LVEndocardium");
			setForegroundColor(255,0,0);
			roiManager("fill");
			
			/*Create inverse version of OuterPerimeter*/
			roiManager("select", 0);
			run("Make Inverse");
			roiManager("add");
			roiManager("select", 9);
			roiManager("rename", "09-InvOuterPerimeter");
			
			/*Create right ventricle subendocardial ROI*/
			roiManager("select", 5);
			run("Enlarge...", "enlarge="+SUBENDOCARDIAL_THICKNESS);
			roiManager("add");
			roiManager("select", 10);
			roiManager("rename", "10-RVDilated");
			roiManager("select", newArray(2,9,7));
			roiManager("or");
			roiManager("add");
			roiManager("select", 11);
			roiManager("rename", "11-RVSubendoSubtract");
			roiManager("select", newArray(10,11));
			roiManager("xor");
			roiManager("add");
			roiManager("select", 12);
			roiManager("rename", "12-RVSubendocardiumComposite");
			
			run("Clear Results");
			run("Set Measurements...", "area redirect=None decimal=3");
			roiManager("select", newArray(10,11,12));
			roiManager("measure");
			area10 = getResult("Area", 0);
			area11 = getResult("Area", 1);
			area12 = getResult("Area", 2);
			
			if(area10+area11 > area12){
				roiManager("select", 12);
				run("Enlarge...", "enlarge=-15");
				number = roiManager("count");
				roiManager("split");
				number2 = roiManager("count");
				diff = number2-number;
				selectArray = newArray(diff);
				
				for(i = 0; i<diff; i++){
					selectArray[i] = number2-i-1;
					roiManager("select", number2-i-1);
					roiManager("rename", "temp_"+number2-i-1);
				}
				
				selectArray[selectArray.length] = 5;
				run("Clear Results");
				roiManager("select", selectArray);
				
				run("Set Measurements...", "area redirect=None decimal=3");
				roiManager("measure");
				AreaArray = Table.getColumn("Area");
				
				lowest = 10000000;
				best = 0;
				for(i=1; i<AreaArray.length; i++){
					if(AreaArray[i] - AreaArray[0] < lowest && AreaArray[i] - AreaArray[0] >= 0 && getROIOverlapDegree(number+i-1, 5) >=0.85){
						lowest = AreaArray[i] - AreaArray[0];
						best = i;
					}
				}
				
				roiManager("deselect");
				roiManager("select", number+best-1);
				roiManager("rename", "13-RVSubendocardiumWithoutHole");
				run("Enlarge...", "enlarge=15");
				roiManager("update");
				removeTempROIs();
			}
			else{
				roiManager("select", 10);
				roiManager("add");
				roiManager("select", 13);
				roiManager("rename", "13-RVSubendocardiumWithoutHole");
			}
			
			roiManager("deselect");
			roiManager("select", newArray(13, 5));
			roiManager("xor");
			roiManager("add");
			roiManager("select", 14);
			roiManager("rename", "14-RVSubendocardium");
			setForegroundColor(0,255,0);
			roiManager("fill");
			
			/*Create left ventricle subendocardial ROI*/
			roiManager("select", 7);
			run("Enlarge...", "enlarge="+SUBENDOCARDIAL_THICKNESS);
			roiManager("add");
			roiManager("select", 15);
			roiManager("rename", "15-LVDilated");
			roiManager("select", newArray(2,9,5));
			roiManager("or");
			roiManager("add");
			roiManager("select", 16);
			roiManager("rename", "16-LVSubendoSubtract");
			roiManager("select", newArray(15,16))
			roiManager("xor");
			roiManager("add");
			roiManager("select", 17);
			roiManager("rename", "17-LVSubendocardiumComposite");
			
			run("Clear Results");
			run("Set Measurements...", "area redirect=None decimal=3");
			roiManager("select", newArray(15,16,17));
			roiManager("measure");
			area15 = getResult("Area", 0);
			area16 = getResult("Area", 1);
			area17 = getResult("Area", 2);
			
			if(area15+area16 > area17){
				roiManager("select", 17);
				run("Enlarge...", "enlarge=-15");
				number = roiManager("count");
				roiManager("split");
				number2 = roiManager("count");
				diff = number2-number;
				selectArray = newArray(diff);
				
				for(i = 0; i<diff; i++){
					selectArray[i] = number2-i-1;
					roiManager("select", number2-i-1);
					roiManager("rename", "temp_"+i);
				}
				
				selectArray[selectArray.length] = 7;
				run("Clear Results");
				roiManager("select", selectArray);
				run("Set Measurements...", "area redirect=None decimal=3");
				roiManager("measure");
				AreaArray = Table.getColumn("Area");
				
				lowest = 10000000;
				best = 0;
				for(i=1; i<AreaArray.length; i++){
					if(AreaArray[i] - AreaArray[0] < lowest && AreaArray[i] - AreaArray[0] >= 0 && getROIOverlapDegree(number+i-1, 7) >=0.85){
						lowest = AreaArray[i] - AreaArray[0];
						best = i;
					}
				}
				
				roiManager("deselect");
				roiManager("select", number+best-1);
				roiManager("rename", "18-LVSubendocardiumWithoutHole");
				run("Enlarge...", "enlarge=15");
				roiManager("update");
				removeTempROIs();
			}
			else{
				roiManager("select", 15);
				roiManager("add");
				roiManager("select", 18);
				roiManager("rename", "18-LVSubendocardiumWithoutHole");
			}
			
			roiManager("deselect");
			roiManager("select", newArray(18, 7));
			roiManager("xor");
			roiManager("add");
			roiManager("select", 19);
			roiManager("rename", "19-LVSubendocardium");
			setForegroundColor(0,255,0);
			roiManager("fill");
			
			/*Create subepicardial ROI*/
			roiManager("select", 1);
			run("Enlarge...", "enlarge="+SUBEPICARDIAL_THICKNESS*(-1));
			roiManager("add");
			roiManager("select", 20);
			roiManager("rename", "20-EpicardiumDilated");
			roiManager("select", newArray(1,20));
			roiManager("xor");
			roiManager("add");
			roiManager("select", 21);
			roiManager("rename", "21-SubEpicardiumWIP");
			roiManager("select", newArray(5,7));
			roiManager("or");
			roiManager("add");
			roiManager("select", 22);
			roiManager("rename", "22-VentrCombined");
			
			if(getROIOverlapDegree(21,22) > 0){
				roiManager("select", newArray(21,22));
				roiManager("and");
				roiManager("add");
				roiManager("select", 23);
				roiManager("rename", "23-SubEpicardiumSubtr");
				roiManager("select", newArray(21,23));
				roiManager("xor");
				roiManager("add");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", 23);
				roiManager("rename", "23-Empty");
				roiManager("deselect");
				roiManager("select", 21);
				roiManager("add");
			}
			roiManager("select", 24);
			roiManager("rename", "24-SubEpicardium");
			setForegroundColor(0,255,255);
			roiManager("fill");
			
			//Create myocardial ROI
			roiManager("select", newArray(2,3,4,6,8,9,14,19,24));
			roiManager("or");
			roiManager("add");
			roiManager("select", 25);
			roiManager("rename", "25-Myocardium");
			run("Make Inverse");
			roiManager("update");
			setForegroundColor(255,255,0);
			roiManager("fill");
			
			/*//Draw interventricular line
			setLineWidth(10);
			setForegroundColor(255,0,255);
			drawLine(c1x, c1y, c2x, c2y);*/
			
			//Draw all outlines
			setForegroundColor(0,0,0);
			setLineWidth(minOf(width,height)/300);
			roiManager("select", newArray(14,19,24));
			roiManager("draw");
			
			//Draw patterns on shared regions
			getDimensions(width, height, channels, slices, frames);
			//Subendocardial overlap
			if(getROIOverlapDegree(14, 19) > 0){
				roiManager("select", newArray(14,19));
				roiManager("and");
				roiManager("add");
				roiManager("select", 26);
				roiManager("rename", "temp-1");
				run("Select None");
				createStripedPattern("Pattern1419", width, height, width/30, "left", 70);
				roiManager("select", 26);
				run("Make Inverse");
				setForegroundColor(255,255,255);
				run("Fill", "slice");
				run("Select None");
				imageCalculator("Min", "Overlay", "Pattern1419");
				if(!File.exists(dir+"Patterns\\")){
					File.makeDirectory(dir+"Patterns\\");
				}
				selectWindow("Pattern1419");
				saveAs("tiff", dir+"Patterns\\"+folder_title+"_Pattern1419.tif");
				pattern1419 = true;
				close();
				removeTempROIs();
			}
			//Subendo-/ Subepicardial overlap
			if(getROIOverlapDegree(14, 24) > 0){
				roiManager("select", newArray(14,24));
				roiManager("and");
				roiManager("add");
				roiManager("select", 26);
				roiManager("rename", "temp-1");
				run("Select None");
				createStripedPattern("Pattern1424", width, height, width/30, "right", 70);
				roiManager("select", 26);
				run("Make Inverse");
				setForegroundColor(255,255,255);
				run("Fill", "slice");
				run("Select None");
				imageCalculator("Min", "Overlay", "Pattern1424");
				if(!File.exists(dir+"Patterns\\")){
					File.makeDirectory(dir+"Patterns\\");
				}
				selectWindow("Pattern1424");
				saveAs("tiff", dir+"Patterns\\"+folder_title+"_Pattern1424.tif");
				close();
				pattern1424 = true;
				removeTempROIs();
			}
			if(getROIOverlapDegree(19, 24) > 0){
				roiManager("select", newArray(19,24));
				roiManager("and");
				roiManager("add");
				roiManager("select", 26);
				roiManager("rename", "temp-1");
				run("Select None");
				createStripedPattern("Pattern1924", width, height, width/30, "right", 70);
				roiManager("select", 26);
				run("Make Inverse");
				setForegroundColor(255,255,255);
				run("Fill", "slice");
				run("Select None");
				imageCalculator("Min", "Overlay", "Pattern1924");
				if(!File.exists(dir+"Patterns\\")){
					File.makeDirectory(dir+"Patterns\\");
				}
				selectWindow("Pattern1924");
				saveAs("tiff", dir+"Patterns\\"+folder_title+"_Pattern1924.tif");
				close();
				pattern1924 = true;
				removeTempROIs();
			}
			
			//Draw ventricle annotations
			selectWindow("Overlay");
			setForegroundColor(0,0,0);
			getDimensions(width, height, channels, slices, frames);
			setFont("SansSerif", minOf(width, height)/20, "bold");
			setJustification("center");
			//Draw LV label at centroid of LV selection
			drawString("LV", lx, ly);
			
			//Find point closest to RV centroid that lies within RV lumen
			//Draw RV label at centroid of RV selection shifted towards the ventricle margin so that label lies within lumen
			getDimensions(width, height, channels, slices, frames);
			roiManager("deselect");
			roiManager("select", 3);
			bisector_angle = getAngleProper(c1x, c1y, c2x, c2y);
			
			if(selectionContains(rx, ry)){
				drawString("RV", rx, ry);
			}
			else{

				for(i=0; i<minOf(width, height)/4; i+=5){
					rv_testpoint1 = getPointOnLineFromX1(rx, ry, bisector_angle, i, 1, false);
					rv_testpoint2 = getPointOnLineFromX1(rx, ry, bisector_angle, i, -1, false);
					rv_string = "RV";
					
					if(selectionContains(rv_testpoint1[0], rv_testpoint1[1])){
						//Mostly horizontal
						if((bisector_angle <= 45 && bisector_angle >= -45) || bisector_angle >= 135 || (bisector_angle >= -180 && bisector_angle <= -135)){
							rv_centerpoint = getPointOnLineFromX1(rv_testpoint1[0], rv_testpoint1[1], bisector_angle, getStringWidth(rv_string)/2, 1, false);
							drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
							break;
						}
						//Mostly vertical
						else if((bisector_angle > 45 && bisector_angle < 135) || (bisector_angle < -45 && bisector_angle > -135)){
							rv_centerpoint = getPointOnLineFromX1(rv_testpoint1[0], rv_testpoint1[1], bisector_angle, getValue("font.height")/2, 1, false);
							drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
							break;
						}
						
					}
					else if(selectionContains(rv_testpoint2[0], rv_testpoint2[1])){
						//Mostly horizontal
						if((bisector_angle <= 45 && bisector_angle >= -45) || bisector_angle >= 135 || (bisector_angle >= -180 && bisector_angle <= -135)){
							rv_centerpoint = getPointOnLineFromX1(rv_testpoint2[0], rv_testpoint2[1], bisector_angle, getStringWidth(rv_string)/2, -1, false);
							drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
							break;
						}
						//Mostly vertical
						else if((bisector_angle > 45 && bisector_angle < 135) || (bisector_angle < -45 && bisector_angle > -135)){
							rv_centerpoint = getPointOnLineFromX1(rv_testpoint2[0], rv_testpoint2[1], bisector_angle, getValue("font.height")/2, -1, false);
							drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
							break;
						}
					}
				}
				roiManager("deselect");
			}
						
			//Construct simplified view of overlay
			getDimensions(width, height, channels, slices, frames);
			newImage("SeptumCrawler", "RGB white", width, height, 1);
			roiManager("select", 25);
			setForegroundColor(255,255,0);
			roiManager("fill");
			roiManager("select", newArray(10,15));
			setForegroundColor(0,255,0);
			roiManager("fill");
			setLineWidth(10);
			/*setForegroundColor(255,0,255);
			drawLine(c1x, c1y, c2x, c2y);*/
			
			//Convert dilated ventricle ROIs to non-composite ROIs, if needed
			roiManager("List");
			typeArray = Table.getColumn("Type");
			run("Clear Results");
			run("Close");
			
			if(typeArray[10] == "Composite"){
				roiManager("deselect");
				roiManager("select", 10);
				number1 = roiManager("count");
				roiManager("split");
				number2 = roiManager("count");
				selectArray = newArray();
				
				for(i=number1; i<number2; i++){
					selectArray[i-number1] = i;
					roiManager("select", i);
					roiManager("rename", "temp-"+toString(i));
				}
				
				roiManager("deselect");
				roiManager("select", selectArray);
				roiManager("measure");
				
				resultArray = newArray();
				for(i=0; i<nResults(); i++){
					resultArray[i] = getResult("Area", i);
				}
				
				index = findIndexOfHighest(resultArray);
				
				roiManager("deselect");
				roiManager("select", 10);
				roiManager("delete");
				roiManager("deselect");
				roiManager("select", index-1+number1);
				
				roiManager("rename", "10-RVDilated");
				roiManager("sort");
				removeTempROIs();
			}
			
			if(typeArray[15] == "Composite"){
				roiManager("deselect");
				roiManager("select", 15);
				number1 = roiManager("count");
				roiManager("split");
				number2 = roiManager("count");
				selectArray = newArray();
				
				for(i=number1; i<number2; i++){
					selectArray[i-number1] = i;
					roiManager("select", i);
					roiManager("rename", "temp-"+toString(i));
				}
				
				roiManager("deselect");
				roiManager("select", selectArray);
				roiManager("measure");
				
				resultArray = newArray();
				for(i=0; i<nResults(); i++){
					resultArray[i] = getResult("Area", i);
				}
				
				index = findIndexOfHighest(resultArray);
				
				roiManager("deselect");
				roiManager("select", 15);
				roiManager("delete");
				roiManager("deselect");
				roiManager("select", index-1+number1);
				
				roiManager("rename", "15-LVDilated");
				roiManager("sort");
				removeTempROIs();
			}
			
			//Check if dilated ventricle ROIs are Composites and if so,
			//delete superfluous ROIs
			roiManager("List");
			typeArray = Table.getColumn("Type");
			run("Clear Results");
			run("Close");
			
			if(typeArray[13] == "Composite"){
				number1 = roiManager("count");
				roiManager("deselect");
				roiManager("select", 13);
				roiManager("split");
				number2 = roiManager("count");
				selectArray = newArray();
				overlapArray = newArray();
				
				for(i=number1; i<number2; i++){
					selectArray[i-number1] = i;
					roiManager("select", i);
					roiManager("rename", "temp-"+toString(i));
					overlapArray[i-number1] = getROIOverlapDegree(i, 10);
				}
				
				index = findIndexOfHighest(overlapArray);
				
				roiManager("deselect");
				roiManager("select", 13);
				roiManager("delete");
				roiManager("deselect");
				roiManager("select", index-1+number1);
				
				roiManager("rename", "13-RVSubendocardiumWithoutHole");
				roiManager("sort");
				removeTempROIs();
			}
			
			if(typeArray[18] == "Composite"){
				number1 = roiManager("count");
				roiManager("deselect");
				roiManager("select", 18);
				roiManager("split");
				number2 = roiManager("count");
				selectArray = newArray();
				overlapArray = newArray();
				
				for(i=number1; i<number2; i++){
					selectArray[i-number1] = i;
					roiManager("select", i);
					roiManager("rename", "temp-"+toString(i));
					overlapArray[i-number1] = getROIOverlapDegree(i, 15);
				}
				
				index = findIndexOfHighest(overlapArray);
				
				roiManager("deselect");
				roiManager("select", 18);
				roiManager("delete");
				roiManager("deselect");
				roiManager("select", index-1+number1);
				
				roiManager("rename", "18-LVSubendocardiumWithoutHole");
				roiManager("sort");
				removeTempROIs();
			}
			
			//Convert dilated ventricle ROIs to splines
			roiManager("deselect");
			roiManager("select", 13);
			run("Area to Line");
			run("Fit Spline");
			roiManager("add");
			roiManager("select", 26);
			roiManager("rename", "26-RVSpline");
			Roi.getSplineAnchors(x10, y10);
			
			roiManager("deselect");
			roiManager("select", 18);
			run("Area to Line");
			run("Fit Spline");
			roiManager("add");
			roiManager("select", 27);
			roiManager("rename", "27-LVSpline");
			Roi.getSplineAnchors(x15, y15);
			
			setForegroundColor(0,0,0);
			
			//Determine points on dilated ventricle edges furthest from ventricle bisector
			
			RVArray = createRVLumenBisector(13, c1x,c1y,c2x,c2y);
			RVXArray = Array.slice(RVArray, 0, RVArray.length/2);
			RVYArray = Array.slice(RVArray, RVArray.length/2, RVArray.length);
			
			LVArray = createLVLumenBisector(18, c1x,c1y,c2x,c2y);
			LVXArray = Array.slice(LVArray, 0, LVArray.length/2);
			LVYArray = Array.slice(LVArray, LVArray.length/2, LVArray.length);
			
			//Find point on spline closest to ones determined above
			lowest = 5000;
			for(i=0; i<x10.length; i++){
				distance = getPointDistance(RVXArray[0], RVYArray[0], x10[i], y10[i]);
				if(distance < lowest){
					lowest = distance;
					index101 = i;
				}
			}
			
			lowest = 5000;
			for(i=0; i<x10.length; i++){
				distance = getPointDistance(RVXArray[RVXArray.length-1], RVYArray[RVYArray.length-1], x10[i], y10[i]);
				if(distance < lowest){
					lowest = distance;
					index102 = i;
				}
			}
			lowest = 5000;
			for(i=0; i<x15.length; i++){
				distance = getPointDistance(LVXArray[0], LVYArray[1], x15[i], y15[i]);
				if(distance < lowest){
					lowest = distance;
					index151 = i;
				}
			}
			lowest = 5000;
			for(i=0; i<x15.length; i++){
				distance = getPointDistance(LVXArray[LVXArray.length-1], LVYArray[LVYArray.length-1], x15[i], y15[i]);
				if(distance < lowest){
					lowest = distance;
					index152 = i;
				}
			}
			
			/*Array.show("RVRadiatingPoints", RVXArray, RVYArray);
			Array.show("LVRadiatingPoints", LVXArray, LVYArray);
			Array.show("RVSpline", x10, y10);
			Array.show("LVSpline", x15, y15);
			
			print("index101: "+index101);
			print("index102: "+index102);
			print("index151: "+index151);
			print("index152: "+index152);*/
			
			//Check which part of the spline array is closer to the other ventricle
			internalXArray = Array.slice(x10, minOf(index101, index102), maxOf(index101, index102)+1);
			rollaroundXArray1 = Array.slice(x10, 0, minOf(index101, index102)+1);
			rollaroundXArray2 = Array.slice(x10, maxOf(index101, index102), x10.length);
			rollaroundXArray = Array.concat(rollaroundXArray2, rollaroundXArray1);
			
			internalYArray = Array.slice(y10, minOf(index101, index102), maxOf(index101, index102)+1);
			rollaroundYArray1 = Array.slice(y10, 0, minOf(index101, index102)+1);
			rollaroundYArray2 = Array.slice(y10, maxOf(index101, index102), y10.length);
			rollaroundYArray = Array.concat(rollaroundYArray2, rollaroundYArray1);
			
			internalMiddlePoint = newArray(internalXArray[internalXArray.length/2], internalYArray[internalYArray.length/2]);
			rollaroundMiddlePoint = newArray(rollaroundXArray[rollaroundXArray.length/2], rollaroundYArray[rollaroundYArray.length/2]);
			
			run("Clear Results");
			run("Set Measurements...", "centroid redirect=None decimal=3");
			roiManager("deselect");
			roiManager("select", 15);
			roiManager("measure");
			
			centroid15 = newArray(getResult("X", 0), getResult("Y", 0));
			
			internal = getPointDistance(internalMiddlePoint[0], internalMiddlePoint[1], centroid15[0], centroid15[1]);
			rollaround = getPointDistance(rollaroundMiddlePoint[0], rollaroundMiddlePoint[1], centroid15[0], centroid15[1]);
			
			if(internal > rollaround){
				counter = 0;
				for(i = minOf(index101, index102)+1; i<maxOf(index101, index102); i++){
					x10 = Array.deleteIndex(x10, i-counter);
					y10 = Array.deleteIndex(y10, i-counter);
					counter++;
				}
				
				//Rearrange resulting array
				x10_1 = Array.slice(x10, 0, minOf(index101, index102));
				x10_2 = Array.slice(x10, minOf(index101, index102)+1, x10.length);
				x10 = Array.concat(x10_2, x10_1);
				y10_1 = Array.slice(y10, 0, minOf(index101, index102));
				y10_2 = Array.slice(y10, minOf(index101, index102)+1, y10.length);
				y10 = Array.concat(y10_2, y10_1);
			}
			else{
				counter = 0;
				for(i = 0; i<minOf(index101, index102); i++){
					x10 = Array.deleteIndex(x10, i-counter);
					y10 = Array.deleteIndex(y10, i-counter);
					counter++;
				}
				length = x10.length;
				counter2 = 0;
				for(i = maxOf(index101, index102)-counter; i<length; i++){
					x10 = Array.deleteIndex(x10, i-counter2);
					y10 = Array.deleteIndex(y10, i-counter2);
					counter2++;
				}
			}
			
			roiManager("deselect");
			roiManager("select", 26);
			Roi.setPolylineSplineAnchors(x10, y10);
			roiManager("update");
			
			internalXArray = Array.slice(x15, minOf(index151, index152), maxOf(index151, index152)+1);
			rollaroundXArray1 = Array.slice(x15, 0, minOf(index151, index152)+1);
			rollaroundXArray2 = Array.slice(x15, maxOf(index151, index152), x15.length);
			rollaroundXArray = Array.concat(rollaroundXArray2, rollaroundXArray1);
			
			internalYArray = Array.slice(y15, minOf(index151, index152), maxOf(index151, index152)+1);
			rollaroundYArray1 = Array.slice(y15, 0, minOf(index151, index152)+1);
			rollaroundYArray2 = Array.slice(y15, maxOf(index151, index152), y15.length);
			rollaroundYArray = Array.concat(rollaroundYArray2, rollaroundYArray1);
			
			internalMiddlePoint = newArray(internalXArray[internalXArray.length/2], internalYArray[internalYArray.length/2]);
			rollaroundMiddlePoint = newArray(rollaroundXArray[rollaroundXArray.length/2], rollaroundYArray[rollaroundYArray.length/2]);
			
			run("Clear Results");
			run("Set Measurements...", "centroid redirect=None decimal=3");
			roiManager("deselect");
			roiManager("select", 13);
			roiManager("measure");
			
			centroid15 = newArray(getResult("X", 0), getResult("Y", 0));
			
			internal = getPointDistance(internalMiddlePoint[0], internalMiddlePoint[1], centroid15[0], centroid15[1]);
			rollaround = getPointDistance(rollaroundMiddlePoint[0], rollaroundMiddlePoint[1], centroid15[0], centroid15[1]);
			
			if(internal > rollaround){
				counter = 0;
				for(i = minOf(index152, index151)+1; i<maxOf(index152, index151); i++){
					x15 = Array.deleteIndex(x15, i-counter);
					y15 = Array.deleteIndex(y15, i-counter);
					counter++;
				}
				
				//Rearrange resulting array
				x15_1 = Array.slice(x15, 0, minOf(index152, index151));
				x15_2 = Array.slice(x15, minOf(index152, index151)+1, x15.length);
				x15 = Array.concat(x15_2, x15_1);
				y15_1 = Array.slice(y15, 0, minOf(index152, index151));
				y15_2 = Array.slice(y15, minOf(index152, index151)+1, y15.length);
				y15 = Array.concat(y15_2, y15_1);
			}
			else{
				counter = 0;
				for(i = 0; i<minOf(index152, index151); i++){
					x15 = Array.deleteIndex(x15, i-counter);
					y15 = Array.deleteIndex(y15, i-counter);
					counter++;
				}
				length = x15.length;
				counter2 = 0;
				for(i = maxOf(index152, index151)-counter; i<length; i++){
					x15 = Array.deleteIndex(x15, i-counter2);
					y15 = Array.deleteIndex(y15, i-counter2);
					counter2++;
				}
			}
			
			roiManager("deselect");
			roiManager("select", 27);
			Roi.setPolylineSplineAnchors(x15, y15);
			roiManager("update");
			
			//Add points on edge of image to spline arrays in order to construct area
			getDimensions(width, height, channels, slices, frames);
				
			concatArray = newArray();
			angle1 = getAngleProper(x10[x10.length/2], y10[y10.length/2], x10[0], y10[0]);
			angle2 = getAngleProper(x10[x10.length/2], y10[y10.length/2], x10[x10.length-1], y10[y10.length-1]);
			
			//Calculate angle between right ventricular lines
			angleDifference21 = getAngleDifference(angle2, angle1);
			/*print("angleDifference21: "+angleDifference21);
			
			setColor(255,0,0);
			makeLineAngleFromX1(x10[x10.length/2], y10[y10.length/2], angle1, 5000, true, 10);
			setColor(0,255,0);
			makeLineAngleFromX1(x10[x10.length/2], y10[y10.length/2], angle2, 5000, true, 10);*/
			
			//If too narrow bend them to widen angle
			if(abs(angleDifference21) < RV_ANGLE_THRESHOLD){
				if(angleDifference21 > 0){
					angle2 = ((180-angleDifference21)/2*LV_ANGLE_CORRECTION_FACTOR/2)+angle2;
					angle1 = ((180-angleDifference21)/(-2)*LV_ANGLE_CORRECTION_FACTOR/2)+angle1;
				}
				else{
					angle2 = ((-180-angleDifference21)/2*LV_ANGLE_CORRECTION_FACTOR/2)+angle2;
					angle1 = ((-180-angleDifference21)/(-2)*LV_ANGLE_CORRECTION_FACTOR/2)+angle1;
				}
			}
			angleDifference21 = getAngleDifference(angle2, angle1);
			/*print("angleDifference21: "+angleDifference21);
			
			setColor(255,0,0);*/
			makeLineAngleFromX1(x10[x10.length/2], y10[y10.length/2], angle1, 5000, true, 10);
			point1 = getPointOnLineFromX1(x10[x10.length/2], y10[y10.length/2], angle1, 5000, 1, true);
			
			concatArray[0] = point1[0];
			x10 = Array.concat(concatArray, x10);
			concatArray[0] = point1[1];
			y10 = Array.concat(concatArray, y10);
						
			//setColor(0,255,0);
			makeLineAngleFromX1(x10[x10.length/2], y10[y10.length/2], angle2, 5000, true, 10);
			point2 = getPointOnLineFromX1(x10[x10.length/2], y10[y10.length/2], angle2, 5000, 1, true);
			
			concatArray[0] = point2[0];
			x10 = Array.concat(x10, concatArray);
			concatArray[0] = point2[1];
			y10 = Array.concat(y10, concatArray);
					
			roiManager("deselect");
			roiManager("select", 26);
			Roi.setPolylineSplineAnchors(x10, y10);
			roiManager("update");

			angle3 = getAngleProper(x15[x15.length/2], y15[y15.length/2], x15[x15.length-1], y15[y15.length-1]);
			angleDifference31 = getAngleDifference(angle3, angle1);
			
			//print("angleDifference31: "+angleDifference31);
			//print("angle3 prev: "+angle3);
			
			if(abs(angleDifference31) > LV_ANGLE_DIFFERENCE_THRESHOLD){
				angle3 = (angleDifference31*(-1)*LV_ANGLE_CORRECTION_FACTOR)+angle3;
			}
			
			point3 = getPointOnLineFromX1(x15[x15.length/2], y15[y15.length/2], angle3, getPointDistance(0, 0, width, height), 1, true);
			
			//Check if lines intersect within the picture frame
			intersect1 = getIntersectionPoint(x10[1], y10[1], x10[0], y10[0], x15[x15.length-2], y15[y15.length-2], point3[0], point3[1]);
			if(intersect1[0] > 0 && intersect1[1] > 0 && intersect1[0] < width && intersect1[1] < height){
				//print("Intersect1");
				angle3 = (angleDifference31*(-1)*LV_ANGLE_CORRECTION_FACTOR)+angle3;
				point3 = getPointOnLineFromX1(x15[x15.length/2], y15[y15.length/2], angle3, getPointDistance(0, 0, width, height), 1, true);
			}
			//print("angle3 after: "+angle3);
			
			makeLineAngleFromX1(x15[x15.length/2], y15[y15.length/2], angle3, getPointDistance(0, 0, width, height), true, 10);
				
			concatArray[0] = point3[0];
			x15 = Array.concat(x15, concatArray);
			concatArray[0] = point3[1];
			y15 = Array.concat(y15, concatArray);
			
			angle4 = getAngleProper(x15[x15.length/2], y15[y15.length/2], x15[0], y15[0]);
			
			angleDifference42 = getAngleDifference(angle4, angle2);	
			//print("angleDifference42: "+angleDifference42);
			//print("angle4 prev: "+angle4);
			
			if(abs(angleDifference42) > LV_ANGLE_DIFFERENCE_THRESHOLD){
				angle4 = (angleDifference42*(-1)*LV_ANGLE_CORRECTION_FACTOR)+angle4;
			}
			//print("angle4 after: "+angle4);
			
			point4 = getPointOnLineFromX1(x15[x15.length/2], y15[y15.length/2], angle4, getPointDistance(0, 0, width, height), 1, true);
			
			//Check if lines intersect within the picture frame
			intersect2 = getIntersectionPoint(x10[x10.length-2], y10[y10.length-2], x10[x10.length-1], y10[y10.length-1], x15[0], y15[0], point4[0], point4[1]);
			//Array.show(intersect2);
			
			if(intersect2[0] > 0 && intersect2[1] > 0 && intersect2[0] < width && intersect2[1] < height){
				//print("Intersect2");
				angle4 = (angleDifference42*(-1)*LV_ANGLE_CORRECTION_FACTOR)+angle4;
				point4 = getPointOnLineFromX1(x15[x15.length/2], y15[y15.length/2], angle4, getPointDistance(0, 0, width, height), 1, true);
			}
			
			makeLineAngleFromX1(x15[x15.length/2], y15[y15.length/2], angle4, getPointDistance(0, 0, width, height), true, 10);

			concatArray[0] = point4[0];
			x15 = Array.concat(concatArray, x15);
			concatArray[0] = point4[1];
			y15 = Array.concat(concatArray, y15);
			
			roiManager("deselect");
			roiManager("select", 27);
			Roi.setPolylineSplineAnchors(x15, y15);
			roiManager("update");
			
			septumArrayX = Array.concat(x10, x15);
			septumArrayY = Array.concat(y10, y15);
			
			//Create segmented line enclosing septum area
			lineString = "makePolygon(";
			
			for(i=0; i<septumArrayX.length; i++){
				lineString+=toString(septumArrayX[i]);
				lineString+=",";
				lineString+=toString(septumArrayY[i]);
				lineString+=",";
			}
			
			lineString = substring(lineString, 0, lineString.length-1);
			lineString += ");";
			eval(lineString);
			
			roiManager("add");
			roiManager("deselect");
			roiManager("select", 28);
			roiManager("rename", "28-Septum");
					
			selectWindow("SeptumCrawler");
			close();
			
			//Create right and left heart ROIs
			roiManager("deselect");
			roiManager("select", 28);
			run("Make Inverse");
			run("Enlarge...", "enlarge=-15");
			number1 = roiManager("count");
			roiManager("split");
			number2 = roiManager("count");
			diff = number2-number1;
			
			//Find two of the non-septum ROI that overlap best with the dilated ventricle ROIs
			selectArray = newArray();
			
			roiManager("List");
			selectWindow("Overlay Elements of Overlay");
			pointsArray = Table.getColumn("Points");
			selectWindow("Overlay Elements of Overlay");
			run("Close");
			
			counter = 0;
			for(i=number1; i<number1+diff; i++){
				roiManager("deselect");
				roiManager("select", i);
				roiManager("rename", "temp-"+toString(i));
				if(pointsArray[i] > 20){
					selectArray[counter] = i;
					counter++;
				}
			}
			
			roiManager("deselect");
			bestROI = -1;
			userIntervention = false;
			highestOverlap = 0;
			for(i=0; i<selectArray.length; i++){
				overlap = getROIOverlapDegree(selectArray[i], 13);
				counterOverlap = getROIOverlapDegree(selectArray[i], 18);
				septumOverlap = getROIOverlapDegree(selectArray[i], 28);
				//print("Right: "+selectArray[i]+": "+overlap+", "+counterOverlap);
				if(overlap > highestOverlap && counterOverlap < overlap && septumOverlap < 0.001){
					highestOverlap = overlap;
					bestROI = selectArray[i];  
				}
			}
			
			if(bestROI == -1){
				selectArray = Array.getSequence(roiManager("count"));
				roiManager("select", selectArray);
				roiManager("Set Fill Color", "magenta");
				roiManager("deselect");
				while(roiManager("count") != number1+2){
					waitForUser("Attention, please!", "The macro cannot determine automatically which of the ROIs named \"temp-...\" represent the Right and Left Heart.\nThe reason for this is that, most likely, both ventricles are located extremely close to each other. Please review all ROIs in question,\ndelete all wrong ones and rename the correct ones \"29-LeftHeart\" and \"30-RightHeart\", respectively.");
				}
				roiManager("sort");
				userIntervention = true;
				
				roiManager("select", selectArray);
				roiManager("Set Fill Color", "white");
				roiManager("deselect");
				roiManager("deselect");
			}
			
			if(!userIntervention){
				roiManager("select", bestROI);
				roiManager("rename", "30-RightHeart");
				run("Enlarge...", "enlarge=15");
				roiManager("update");
				
				roiManager("deselect");
				bestROI = -1;
				
				highestOverlap = 0;
				for(i=0; i<selectArray.length; i++){
					overlap = getROIOverlapDegree(selectArray[i], 18);
					counterOverlap = getROIOverlapDegree(selectArray[i], 13);
					septumOverlap = getROIOverlapDegree(selectArray[i], 28);
					//print("Left: "+selectArray[i]+": "+overlap+", "+counterOverlap+", "+septumOverlap);
					if(overlap > highestOverlap && counterOverlap < overlap && septumOverlap < 0.001){
						highestOverlap = overlap;
						bestROI = selectArray[i];
					}
				}

				roiManager("select", bestROI);
				roiManager("rename", "29-LeftHeart");
				run("Enlarge...", "enlarge=15");
				roiManager("update");
				roiManager("sort");
				
				roiManager("deselect");
				removeTempROIs();
			}
			else{
				roiManager("select", 29);
				run("Enlarge...", "enlarge=15");
				roiManager("select", 30);
				run("Enlarge...", "enlarge=15");
				roiManager("deselect");
			}
			
			LHIndex = 29;
			RHIndex = 30;

			//Exclude parts of each ROI not part of the heart itself
			roiManager("deselect");
			roiManager("select", newArray(0,28));
			roiManager("and");
			roiManager("add");
			roiManager("deselect");
			roiManager("select", 28);
			name = Roi.getName;
			roiManager("delete");
			roiManager("select", roiManager("count")-1);
			roiManager("rename", name);
			roiManager("sort");
			
			roiManager("deselect");
			roiManager("select", newArray(0,29));
			roiManager("and");
			roiManager("add");
			roiManager("deselect");
			roiManager("select", 29);
			name = Roi.getName;
			roiManager("delete");
			roiManager("select", roiManager("count")-1);
			roiManager("rename", name);
			roiManager("sort");
			
			roiManager("deselect");
			roiManager("select", newArray(0,30));
			roiManager("and");
			roiManager("add");
			roiManager("deselect");
			roiManager("select", 30);
			name = Roi.getName;
			roiManager("delete");
			roiManager("select", roiManager("count")-1);
			roiManager("rename", name);
			roiManager("sort");
		
			//Add parts of septum to subendocardia if they belong there
			if(getROIOverlapDegree(18, 28) > 0){
				roiManager("select", newArray(28,18));
				roiManager("and");
				roiManager("add");
				roiManager("select", 31);
				roiManager("rename", "temp-1");
				roiManager("select", newArray(29,31));
				roiManager("or");
				roiManager("update");
				removeTempROIs();
				//Remove small pixel holes from combining ROIs
				roiManager("select", 29);
				run("Create Mask");
				run("Invert");
				run("Analyze Particles...", "size=0-80 show=Masks");
				run("Create Selection");
				selectWindow("Mask");
				run("Invert");
				run("Restore Selection");
				setForegroundColor(0,0,0);
				run("Fill", "slice");
				selectWindow("Mask of Mask");
				close();
				run("Select None");
				run("Create Selection");
				selectWindow("Overlay");
				run("Restore Selection");
				roiManager("add");
				roiManager("select", 29);
				roiManager("delete");
				roiManager("select", 30);
				roiManager("rename", "29-LeftHeart");
				roiManager("sort");
				selectWindow("Mask");
				pattern1828 = true;
				close();
			}
			
			if(getROIOverlapDegree(13, 28) > 0){
				roiManager("select", newArray(28,13));
				roiManager("and");
				roiManager("add");
				roiManager("select", 31);
				roiManager("rename", "temp-1");
				roiManager("select", newArray(30,31));
				roiManager("or");
				roiManager("update");
				removeTempROIs();
				//Remove small pixel holes from combining ROIs
				roiManager("select", 30);
				run("Create Mask");
				run("Invert");
				run("Analyze Particles...", "size=0-80 show=Masks");
				run("Create Selection");
				selectWindow("Mask");
				run("Invert");
				run("Restore Selection");
				setForegroundColor(0,0,0);
				run("Fill", "slice");
				selectWindow("Mask of Mask");
				close();
				run("Select None");
				run("Create Selection");
				selectWindow("Overlay");
				run("Restore Selection");
				roiManager("add");
				roiManager("select", 30);
				roiManager("delete");
				roiManager("select", 30);
				roiManager("rename", "30-RightHeart");
				roiManager("sort");
				selectWindow("Mask");
				pattern1328 = true;
				close();
			}

			//Remove overlap between subendocardia and septum from ROI, if present
			if(getROIOverlapDegree(28, 29) > 0){
				roiManager("select", newArray(28,29));
				roiManager("and");
				roiManager("add");
				roiManager("select", 31);
				roiManager("rename", "temp-1");
				run("Make Inverse");
				roiManager("update");
				roiManager("select", newArray(28,31));
				roiManager("and");
				roiManager("add");
				removeTempROIs();
				roiManager("select", 31);
				roiManager("rename", "temp-1");
				roiManager("select", 28);
				roiManager("delete");
				roiManager("select", 30);
				roiManager("rename", "28-Septum");
				roiManager("sort");
			}
			if(getROIOverlapDegree(28, 30) > 0){
				roiManager("select", newArray(28,30));
				roiManager("and");
				roiManager("add");
				roiManager("select", 31);
				roiManager("rename", "temp-1");
				run("Make Inverse");
				roiManager("update");
				roiManager("select", newArray(28,31));
				roiManager("and");
				roiManager("add");
				removeTempROIs();
				roiManager("select", 31);
				roiManager("rename", "temp-1");
				roiManager("select", 28);
				roiManager("delete");
				roiManager("select", 30);
				roiManager("rename", "28-Septum");
				roiManager("sort");
			}
									
			//Create remaining epicardial ROIs
			if(getROIOverlapDegree(30, 2) > 0){
				roiManager("deselect");
				roiManager("select", newArray(RHIndex, 2));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "31-RHEpicardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "31-RHEpicardium-(Empty)");
				roiManager("deselect");
			}
			
			if(getROIOverlapDegree(29, 2) > 0){
				roiManager("deselect");
				roiManager("select", newArray(LHIndex, 2));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "32-LHEpicardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "32-LHEpicardium-(Empty)");
				roiManager("deselect");
			}
			
			if(getROIOverlapDegree(28, 2) > 0){
				roiManager("deselect");
				roiManager("select", newArray(28, 2));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "33-SeptumEpicardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "33-SeptumEpicardium-(Empty)");
				roiManager("deselect");
			}
			
			//Create remaining subepicardial ROIs
			if(getROIOverlapDegree(30, 24) > 0){
				roiManager("deselect");
				roiManager("select", newArray(RHIndex, 24));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "34-RHSubepicardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "34-RHSubepicardium-(Empty)");
				roiManager("deselect");
			}
			
			if(getROIOverlapDegree(29, 24) > 0){
				roiManager("deselect");
				roiManager("select", newArray(LHIndex, 24));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "35-LHSubepicardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "35-LHSubepicardium-(Empty)");
				roiManager("deselect");
			}
			
			if(getROIOverlapDegree(28, 24) > 0){
				roiManager("deselect");
				roiManager("select", newArray(28, 24));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "36-SeptumSubepicardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "36-SeptumSubepicardium-(Empty)");
				roiManager("deselect");
			}
			
			//Create remaining myocardial ROIs
			if(getROIOverlapDegree(RHIndex, 25) > 0){
				roiManager("deselect");
				roiManager("select", newArray(RHIndex, 25));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "37-RHMyocardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "37-RHMyocardium-(Empty)");
				roiManager("deselect");
			}
			
			if(getROIOverlapDegree(LHIndex, 25) > 0){
				roiManager("deselect");
				roiManager("select", newArray(LHIndex, 25));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "38-LHMyocardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "38-LHMyocardium-(Empty)");
				roiManager("deselect");
			}
			
			if(getROIOverlapDegree(28, 25) > 0){
				roiManager("deselect");
				roiManager("select", newArray(28, 25));
				roiManager("and");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "39-SeptumMyocardium");
			}
			else{
				makePoint(0,0);
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "39-SeptumMyocardium-(Empty)");
				roiManager("deselect");
			}
			
			//Remove vasular collagen
			if(EXCLUDE_PERIVASCULAR_COLLAGEN){
				showStatus("!Excluding perivascular collagen...");
				selectWindow(title);
				run("Select None");
				run("Duplicate...", "title=VascularCollagen");
				run("Lab Stack");
				run("Stack to Images");
				selectWindow("L*");
				close();
				selectWindow("b*");
				close();
				setThreshold(VASCULAR_RECOGNITION_THRESHOLD,100);
				run("Create Mask");
				run("Duplicate...", "title=mask-copy");
				
				run("Options...", "iterations=7 count=1 do=Dilate");
				run("Options...", "iterations=4 count=1 do=Erode");
				run("Analyze Particles...", "size="+MINIMUM_BLOOD_VESSEL_AREA+"-"+MAXIMUM_BLOOD_VESSEL_AREA+" show=Masks");
				roiManager("Show None");
				rename("mask-2");
				run("Duplicate...", "title=mask-3");
				run("Fill Holes");
				imageCalculator("Difference create", "mask-2","mask-3");
				rename("mult1");
				run("Invert");
				
				selectWindow("mask");
				run("Options...", "iterations=4 count=1 do=Dilate");
				run("Options...", "iterations=2 count=1 do=Erode");
				run("Analyze Particles...", "size="+MINIMUM_BLOOD_VESSEL_AREA+"-"+MAXIMUM_BLOOD_VESSEL_AREA+" show=Masks");
				roiManager("Show None");
				rename("mask-4");
				run("Duplicate...", "title=mask-5");
				run("Fill Holes");
				imageCalculator("Difference create", "mask-4","mask-5");
				rename("mult2");
				run("Invert");
				
				imageCalculator("Multiply create", "mult1","mult2");
				run("Invert");
				number1 = roiManager("count");
				run("Analyze Particles...", "size="+MINIMUM_LUMEN_AREA+"-"+MAXIMUM_BLOOD_VESSEL_AREA+" show=Masks add");
				roiManager("Show None");
				number2 = roiManager("count");
				selectWindow("Result of mult1");
				close;
				selectWindow("mask-3");
				close;
				selectWindow("mask-4");
				close;
				selectWindow("mask-5");
				close;
				selectWindow("mask-copy");
				close;
				selectWindow("mult1");
				close;
				selectWindow("mult2");
				close;
				selectWindow("mask");
				close;
				run("Set Measurements...", "bounding redirect=None decimal=3");
				
				for(i=number1; i<number2; i++){
					roiManager("Show None");
					roiManager("deselect");
					run("Clear Results");
					roiManager("select", i);
					roiManager("measure");
					x = getResult("Width", 0);
					y = getResult("Height", 0);
					run("Enlarge...", "enlarge="+maxOf(x,y)/1.5);
					roiManager("update");
				}
				
				selectWindow("mask-2");
				selectionArray = Array.getSequence(roiManager("count"));
				selectionArray = Array.slice(selectionArray, number1, number2);
				roiManager("select", selectionArray);
				roiManager("or");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				run("Make Inverse");
				setForegroundColor(255,255,255);
				run("Fill", "slice");
				roiManager("deselect");
				
				run("Select All");
				run("Analyze Particles...", "size="+MINIMUM_BLOOD_VESSEL_AREA+"-"+MAXIMUM_BLOOD_VESSEL_AREA+" add");
				roiManager("Show None");
				roiManager("select", selectionArray);
				roiManager("delete");
				roiManager("select", number1);
				roiManager("delete");
				
				selectionArray = Array.getSequence(roiManager("count"));
				selectionArray = Array.slice(selectionArray, number1, roiManager("count"));
				
				roiManager("deselect");
				roiManager("select", selectionArray);
				roiManager("or");
				roiManager("add");
				roiManager("select", roiManager("count")-1);
				roiManager("rename", "40-PerivascularCollagen");
				
				roiManager("select", selectionArray);
				roiManager("delete");
				
				selectWindow("mask-2");
				close();
				selectWindow("Mask of Result of mult1");
				run("Select None");
				roiManager("Show None");
				run("Analyze Particles...", "size="+MINIMUM_LUMEN_AREA+"-"+MAXIMUM_BLOOD_VESSEL_AREA+" add");
				roiManager("Show None");
				selectionArray = Array.getSequence(roiManager("count"));
				selectionArray = Array.slice(selectionArray, 41, roiManager("count"));
				roiManager("deselect");
				roiManager("select", selectionArray);
				roiManager("or");
				roiManager("add");
				roiManager("deselect");
				roiManager("select", selectionArray);
				roiManager("delete");
				roiManager("select", newArray(40, roiManager("count")-1));
				roiManager("xor");
				roiManager("update");
				roiManager("deselect");
				roiManager("select", roiManager("count")-1);
				roiManager("delete");
				close();
				selectWindow("a*");
				close();
				roiManager("deselect");
				
				collagenArray = newArray(2, 3, 4, 6, 8, 14, 19, 24, 25, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39);
				
				//Update all important ROIs by excising perivascular collagen
				for(i=0; i<collagenArray.length; i++){
					roiManager("deselect");
					if(getROIOverlapDegree(collagenArray[i], 40) > 0){
						roiManager("select", collagenArray[i]);
						name = Roi.getName();
						roiManager("select", newArray(40, collagenArray[i]));
						roiManager("and");
						roiManager("add");
						roiManager("select", newArray(roiManager("count")-1, collagenArray[i]));
						roiManager("xor");
						roiManager("add");
						roiManager("deselect");
						roiManager("select", roiManager("count")-2);
						roiManager("delete");
						roiManager("select", collagenArray[i]);
						roiManager("delete");
						roiManager("select", roiManager("count")-1);
						roiManager("rename", name);
						roiManager("sort");
					}
				}
			}
		
			showStatus("!Saving selected images...");
			run("Clear Results");
			if(SAVE_STRATA_SKETCH){
				selectWindow("Overlay");
				if(EXCLUDE_PERIVASCULAR_COLLAGEN){
					roiManager("deselect");
					setForegroundColor(100,100,100);
					roiManager("select", 40);
					roiManager("fill");
				}
				if(!File.exists(dir+"Sketches\\")){
					File.makeDirectory(dir+"Sketches\\");
				}
				saveAs("png", dir+"Sketches\\"+folder_title+"_StrataSketch.png");
				sketchTitle = getTitle();
				if(!SAVE_STRATA_OVERLAY){
					selectWindow(folder_title+"_StrataSketch.png");
					close();
				}
			}

			if(SAVE_STRATA_OVERLAY){
				selectWindow(title);
				run("Select None");
				run("Duplicate...", "title=STRATA_OVERLAY_BASE");
				run("Add Image...", "image="+sketchTitle+" x=0 y=0 opacity=50");
				if(!File.exists(dir+"Overlays\\")){
					File.makeDirectory(dir+"Overlays\\");
				}
				saveAs("jpeg", dir+"Overlays\\"+folder_title+"_StrataOverlay.jpg");
			}

			selectWindow(title);
			close("\\Others");
			run("Select None");
			
			if(SAVE_STRATA_STACK){
				run("Duplicate...", "title=Epicardium");
				run("Duplicate...", "title=Subepicardium");
				run("Duplicate...", "title=Myocardium");
				run("Duplicate...", "title=RightSubendocardium");
				run("Duplicate...", "title=LeftSubendocardium");
				run("Duplicate...", "title=RightEndocardium");
				run("Duplicate...", "title=LeftEndocardium");
				run("Images to Stack", "name="+title+" title=[] use");
				
				setForegroundColor(255,255,255);
				run("Next Slice [>]");
				
				roiManager("select", 2);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 24);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 25);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 14);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 19);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 6);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 8);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				setSlice(1);
				if(!File.exists(dir+"Stacks\\")){
					File.makeDirectory(dir+"Stacks\\");
				}
				saveAs("tiff", dir+"Stacks\\"+folder_title+"_StrataSegmentationStack.tif");
				selectWindow(folder_title+"_StrataSegmentationStack.tif");
				close();
				open(path);
			}
			
			selectWindow(title);
			run("Clear Results");
			run("Select None");
			getDimensions(width, height, channels, slices, frames);
			
			if(SAVE_RSL_SKETCH || SAVE_RSL_OVERLAY){
				newImage("Overlay", "RGB white", width, height, 1);
				
				roiManager("deselect");
				roiManager("select", 29);
				setForegroundColor(255,255,0);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 28);
				setForegroundColor(0,255,0);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 30);
				setForegroundColor(0,255,255);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 3);
				setForegroundColor(255, 255, 255);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 4);
				setForegroundColor(255, 255, 255);
				roiManager("fill");
				
				if(getROIOverlapDegree(29,30) > 0){
					roiManager("select", newArray(29,30));
					roiManager("and");
					roiManager("add");
					roiManager("select", roiManager("count")-1);
					roiManager("rename", "temp-1");
					run("Select None");
					createStripedPattern("Pattern2930", width, height, width/30, "horizontal", 70);
					roiManager("select", roiManager("count")-1);
					run("Make Inverse");
					setForegroundColor(255,255,255);
					run("Fill", "slice");
					run("Select None");
					imageCalculator("Min", "Overlay", "Pattern2930");
					if(!File.exists(dir+"Patterns\\")){
						File.makeDirectory(dir+"Patterns\\");
					}
					selectWindow("Pattern2930");
					saveAs("tiff", dir+"Patterns\\"+folder_title+"_Pattern2930.tif");
					close();
					pattern2930 = true;
					removeTempROIs();
				}
				
				setLineWidth(minOf(width,height)/300);
				roiManager("deselect");
				setForegroundColor(0,0,0);
				roiManager("select", newArray(3,4,28,29,30));
				roiManager("draw");
				
				if(EXCLUDE_PERIVASCULAR_COLLAGEN){
					roiManager("deselect");
					setForegroundColor(100,100,100);
					roiManager("select", 40);
					roiManager("fill");
				}
				
				//Draw interventricular line
				/*setLineWidth(10);
				setForegroundColor(255,0,255);
				drawLine(c1x, c1y, c2x, c2y);*/
				
				//Draw ventricle annotations
				setForegroundColor(0, 0, 0);
				setFont("SansSerif", minOf(width, height)/20, "bold");
				setJustification("center");
				//Draw LV label at centroid of LV selection
				drawString("LV", lx, ly);
				
				//Find point closest to RV centroid that lies within RV lumen
				//Draw RV label at centroid of RV selection shifted towards the ventricle margin so that label lies within lumen
				getDimensions(width, height, channels, slices, frames);
				roiManager("deselect");
				roiManager("select", 3);
				bisector_angle = getAngleProper(c1x, c1y, c2x, c2y);
				
				if(selectionContains(rx, ry)){
					drawString("RV", rx, ry);
				}
				else{
	
					for(i=0; i<minOf(width, height)/4; i+=5){
						rv_testpoint1 = getPointOnLineFromX1(rx, ry, bisector_angle, i, 1, false);
						rv_testpoint2 = getPointOnLineFromX1(rx, ry, bisector_angle, i, -1, false);
						rv_string = "RV";
						
						if(selectionContains(rv_testpoint1[0], rv_testpoint1[1])){
							//Mostly horizontal
							if((bisector_angle <= 45 && bisector_angle >= -45) || bisector_angle >= 135 || (bisector_angle >= -180 && bisector_angle <= -135)){
								rv_centerpoint = getPointOnLineFromX1(rv_testpoint1[0], rv_testpoint1[1], bisector_angle, getStringWidth(rv_string)/2, 1, false);
								drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
								break;
							}
							//Mostly vertical
							else if((bisector_angle > 45 && bisector_angle < 135) || (bisector_angle < -45 && bisector_angle > -135)){
								rv_centerpoint = getPointOnLineFromX1(rv_testpoint1[0], rv_testpoint1[1], bisector_angle, getValue("font.height")/2, 1, false);
								drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
								break;
							}
							
						}
						else if(selectionContains(rv_testpoint2[0], rv_testpoint2[1])){
							//Mostly horizontal
							if((bisector_angle <= 45 && bisector_angle >= -45) || bisector_angle >= 135 || (bisector_angle >= -180 && bisector_angle <= -135)){
								rv_centerpoint = getPointOnLineFromX1(rv_testpoint2[0], rv_testpoint2[1], bisector_angle, getStringWidth(rv_string)/2, -1, false);
								drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
								break;
							}
							//Mostly vertical
							else if((bisector_angle > 45 && bisector_angle < 135) || (bisector_angle < -45 && bisector_angle > -135)){
								rv_centerpoint = getPointOnLineFromX1(rv_testpoint2[0], rv_testpoint2[1], bisector_angle, getValue("font.height")/2, -1, false);
								drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
								break;
							}
						}
					}
					roiManager("deselect");
				}
				
				if(SAVE_RSL_SKETCH){
					if(!File.exists(dir+"Sketches\\")){
						File.makeDirectory(dir+"Sketches\\");
					}
					saveAs("png", dir+"Sketches\\"+folder_title+"_RSLSketch.png");
					sketchTitle = getTitle();
				}
				if(!SAVE_RSL_OVERLAY){
					selectWindow(folder_title+"_RSLSketch.png");
					close();
				}
			}
		
			if(SAVE_RSL_OVERLAY){
				selectWindow(title);
				run("Select None");
				run("Duplicate...", "title=RSL_OVERLAY_BASE");
				run("Add Image...", "image="+sketchTitle+" x=0 y=0 opacity=50");
				if(!File.exists(dir+"Overlays\\")){
					File.makeDirectory(dir+"Overlays\\");
				}
				saveAs("jpeg", dir+"Overlays\\"+folder_title+"_RSLOverlay.jpg");
			}
			
			selectWindow(title);
			close("\\Others");
			run("Select None");
			
			if(SAVE_RSL_STACK){
				run("Duplicate...", "title=RightHeart");
				run("Duplicate...", "title=Septum");
				run("Duplicate...", "title=LeftHeart");
				run("Images to Stack", "name="+title+" title=[] use");
				
				setForegroundColor(255,255,255);
				run("Next Slice [>]");
				
				roiManager("select", 30);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 28);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 29);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				setSlice(1);
				if(!File.exists(dir+"Stacks\\")){
					File.makeDirectory(dir+"Stacks\\");
				}
				saveAs("tiff", dir+"Stacks\\"+folder_title+"_RSLSegmentationStack.tif");
				selectWindow(folder_title+"_RSLSegmentationStack.tif");
				close();
				open(path);
			}
			
			selectWindow(title);
			run("Clear Results");
			run("Select None");
			getDimensions(width, height, channels, slices, frames);
			if(SAVE_COMBINATION_SKETCH || SAVE_COMBINATION_OVERLAY){
				newImage("Overlay", "RGB white", width, height, 1);
				
				roiManager("deselect");
				roiManager("select", 31);
				setForegroundColor(170,0,0);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 33);
				setForegroundColor(255,0,0);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 32);
				setForegroundColor(255,150,150);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 34);
				setForegroundColor(0,170,170);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 36);
				setForegroundColor(0,255,255);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 35);
				setForegroundColor(200,255,255);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 37);
				setForegroundColor(180,180,0);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 39);
				setForegroundColor(255,255,0);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 38);
				setForegroundColor(255,255,170);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 14);
				setForegroundColor(0,140,0);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 19);
				setForegroundColor(122,255,122);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 6);
				setForegroundColor(170,0,0);
				roiManager("fill");
				
				roiManager("deselect");
				roiManager("select", 8);
				setForegroundColor(255,150,150);
				roiManager("fill");
											
				setLineWidth(minOf(width,height)/300);
				roiManager("deselect");
				setForegroundColor(0,0,0);
				roiManager("select", newArray(28,29,30,14,19,24));
				roiManager("draw");
				
				if(EXCLUDE_PERIVASCULAR_COLLAGEN){
					roiManager("deselect");
					setForegroundColor(100,100,100);
					roiManager("select", 40);
					roiManager("fill");
				}
				if(pattern1419){
					open(dir+"Patterns\\"+folder_title+"_Pattern1419.tif");
					imageCalculator("Min", "Overlay", folder_title+"_Pattern1419.tif");
					selectWindow(folder_title+"_Pattern1419.tif");
					close();
				}
				if(pattern1424){
					open(dir+"Patterns\\"+folder_title+"_Pattern1424.tif");
					imageCalculator("Min", "Overlay", folder_title+"_Pattern1424.tif");
					selectWindow(folder_title+"_Pattern1424.tif");
					close();
				}
				if(pattern1924){
					open(dir+"Patterns\\"+folder_title+"_Pattern1924.tif");
					imageCalculator("Min", "Overlay", folder_title+"_Pattern1924.tif");
					selectWindow(folder_title+"_Pattern1924.tif");
					close();
				}
				if(pattern2930){
					open(dir+"Patterns\\"+folder_title+"_Pattern2930.tif");
					imageCalculator("Min", "Overlay", folder_title+"_Pattern2930.tif");
					selectWindow(folder_title+"_Pattern2930.tif");
					close();
				}
				//Draw interventricular line
				/*setLineWidth(10);
				setForegroundColor(255,0,255);
				drawLine(c1x, c1y, c2x, c2y);*/
				
				//Draw ventricle annotations
				setForegroundColor(0, 0, 0);
				setFont("SansSerif", minOf(width, height)/20, "bold");
				setJustification("center");
				//Draw LV label at centroid of LV selection
				drawString("LV", lx, ly);
				
				//Find point closest to RV centroid that lies within RV lumen
				//Draw RV label at centroid of RV selection shifted towards the ventricle margin so that label lies within lumen
				getDimensions(width, height, channels, slices, frames);
				roiManager("deselect");
				roiManager("select", 3);
				bisector_angle = getAngleProper(c1x, c1y, c2x, c2y);
				
				if(selectionContains(rx, ry)){
					drawString("RV", rx, ry);
				}
				else{
	
					for(i=0; i<minOf(width, height)/4; i+=5){
						rv_testpoint1 = getPointOnLineFromX1(rx, ry, bisector_angle, i, 1, false);
						rv_testpoint2 = getPointOnLineFromX1(rx, ry, bisector_angle, i, -1, false);
						rv_string = "RV";
						
						if(selectionContains(rv_testpoint1[0], rv_testpoint1[1])){
							//Mostly horizontal
							if((bisector_angle <= 45 && bisector_angle >= -45) || bisector_angle >= 135 || (bisector_angle >= -180 && bisector_angle <= -135)){
								rv_centerpoint = getPointOnLineFromX1(rv_testpoint1[0], rv_testpoint1[1], bisector_angle, getStringWidth(rv_string)/2, 1, false);
								drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
								break;
							}
							//Mostly vertical
							else if((bisector_angle > 45 && bisector_angle < 135) || (bisector_angle < -45 && bisector_angle > -135)){
								rv_centerpoint = getPointOnLineFromX1(rv_testpoint1[0], rv_testpoint1[1], bisector_angle, getValue("font.height")/2, 1, false);
								drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
								break;
							}
							
						}
						else if(selectionContains(rv_testpoint2[0], rv_testpoint2[1])){
							//Mostly horizontal
							if((bisector_angle <= 45 && bisector_angle >= -45) || bisector_angle >= 135 || (bisector_angle >= -180 && bisector_angle <= -135)){
								rv_centerpoint = getPointOnLineFromX1(rv_testpoint2[0], rv_testpoint2[1], bisector_angle, getStringWidth(rv_string)/2, -1, false);
								drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
								break;
							}
							//Mostly vertical
							else if((bisector_angle > 45 && bisector_angle < 135) || (bisector_angle < -45 && bisector_angle > -135)){
								rv_centerpoint = getPointOnLineFromX1(rv_testpoint2[0], rv_testpoint2[1], bisector_angle, getValue("font.height")/2, -1, false);
								drawString("RV", rv_centerpoint[0], rv_centerpoint[1]);
								break;
							}
						}
					}
					roiManager("deselect");
				}
				
				if(SAVE_COMBINATION_SKETCH){
					if(!File.exists(dir+"Sketches\\")){
						File.makeDirectory(dir+"Sketches\\");
					}
					saveAs("png", dir+"Sketches\\"+folder_title+"_CombinationSketch.png");
					sketchTitle = getTitle();
				}
				if(!SAVE_COMBINATION_OVERLAY){
					selectWindow(folder_title+"_CombinationSketch.png");
					close();
				}
			}
			
			if(SAVE_COMBINATION_OVERLAY){
				selectWindow(title);
				run("Select None");
				run("Duplicate...", "title=COMBINATION_OVERLAY_BASE");
				run("Add Image...", "image="+sketchTitle+" x=0 y=0 opacity=50");
				if(!File.exists(dir+"Overlays\\")){
					File.makeDirectory(dir+"Overlays\\");
				}
				saveAs("jpeg", dir+"Overlays\\"+folder_title+"_CombinationOverlay.jpg");
			}
			
			selectWindow(title);
			close("\\Others");
			run("Select None");
			
			if(SAVE_COMBINATION_STACK){
				run("Duplicate...", "title=RightEpicardium");
				run("Duplicate...", "title=SeptumEpicardium");
				run("Duplicate...", "title=LeftEpicardium");
				run("Duplicate...", "title=RightSubepicardium");
				run("Duplicate...", "title=SeptumSubepicardium");
				run("Duplicate...", "title=LeftSubepicardium");
				run("Duplicate...", "title=RightMyocardium");
				run("Duplicate...", "title=SeptumMyocardium");
				run("Duplicate...", "title=LeftMyocardium");
				run("Duplicate...", "title=RightSubendocardium");
				run("Duplicate...", "title=LeftSubendocardium");
				run("Duplicate...", "title=RightEndocardium");
				run("Duplicate...", "title=LeftEndocardium");
				run("Images to Stack", "name="+title+" title=[] use");
				
				setForegroundColor(255,255,255);
				run("Next Slice [>]");
				
				roiManager("select", 31);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 33);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 32);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 34);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 36);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 35);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 37);
				if(Roi.getName != "37-RHMyocardium-(Empty)"){
					run("Make Inverse");
					run("Fill", "slice");
					run("Select None");
					run("Next Slice [>]");
				}
				else{
					run("Select All");
					run("Fill", "slice");
					run("Select None");
					run("Next Slice [>]");
				}
				
				roiManager("select", 39);
				if(Roi.getName != "39-SeptumMyocardium-(Empty)"){
					run("Make Inverse");
					run("Fill", "slice");
					run("Select None");
					run("Next Slice [>]");
				}
				else{
					run("Select All");
					run("Fill", "slice");
					run("Select None");
					run("Next Slice [>]");
				}
				
				roiManager("select", 38);
				if(Roi.getName != "38-LHMyocardium-(Empty)"){
					run("Make Inverse");
					run("Fill", "slice");
					run("Select None");
					run("Next Slice [>]");
				}
				else{
					run("Select All");
					run("Fill", "slice");
					run("Select None");
					run("Next Slice [>]");
				}
				
				roiManager("select", 14);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 19);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 6);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				roiManager("select", 8);
				run("Make Inverse");
				run("Fill", "slice");
				run("Select None");
				run("Next Slice [>]");
				
				setSlice(1);
				if(!File.exists(dir+"Stacks\\")){
					File.makeDirectory(dir+"Stacks\\");
				}
				saveAs("tiff", dir+"Stacks\\"+folder_title+"_CombinedSegmentationStack.tif");
			}
			
			getDimensions(width, height, channels, slices, frames);
			run("Close All");
			/*selectWindow("ROI Manager");*/
			//run("Close");
			selectWindow("Results");
			run("Close");
			run("Colors...", "selection=yellow");
					
			//Save output files (ROIs, Overlay image, Segmented Stack) 
			if(SAVE_ROIS_AS_ZIP){
				roiManager("save", dir+folder_title+"_ROIs.zip");
			}
			
			if(ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION && (PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
				//Open high-resolution image
				height1 = height;
				showStatus("!Opening high-resolution image...");
				open(replace(path, "_Scale.jpg", ".tif"));
				getDimensions(width, height, channels, slices, frames);
				height2 = height;
			
				factor = height2 / height1;
			
				//Upscale ROIs to fit high-resolution image
				for(i=0; i<roiManager("count"); i++){
					roiManager("select", i);
					run("Scale... ", "x="+factor+" y="+factor);
					roiManager("update");
				}
				if(SET_SCALE){
					if(unit == "µm"){
						unit = fromCharCode(181)+"m";
					}
					run("Set Scale...", "distance="+scale+" known=1 unit="+unit);
				}
			}
			else if(PERFORM_ANALYSIS || PERFORM_ANALYSIS_WITHOUT_SEGMENTATION){
				open(path);
				if(SET_SCALE){
					if(unit == "µm"){
						unit = fromCharCode(181)+"m";
					}
					run("Set Scale...", "distance="+scale+" known=1 unit="+unit);
				}
			}
		}
		
		if(PERFORM_ANALYSIS && !PERFORM_SEGMENTATION){
			if(roiManager("count") > 0){
				selectWindow("ROI Manager");
				run("Close");
			}
			fileList = getFileList(dir);
			if(!File.exists(dir+folder_title+"_ROIs.zip")){
				showMessage("Error", "A ROI archive could not be found in the image directory. Please make sure that the file exists and is named correctly (folder name + \"_ROIs.zip\").");
				exit();
			}
			roiManager("open", dir+folder_title+"_ROIs.zip");
			
			if(ANALYZE_HIGH_RESOLUTION_IMAGE_AFTER_SEGMENTATION){
				//Open high-resolution image
				getDimensions(width, height, channels, slices, frames);
				height1 = height;
				
				showStatus("!Opening high-resolution image...");
				open(replace(path, "_Scale.jpg", ".tif"));
				
				getDimensions(width, height, channels, slices, frames);
				height2 = height;
				factor = height2 / height1;
				
				//Upscale ROIs to fit high-resolution image
				for(i=0; i<roiManager("count"); i++){
					roiManager("select", i);
					run("Scale... ", "x="+factor+" y="+factor);
					roiManager("update");
				}
				if(SET_SCALE){
					if(unit == "µm"){
						unit = fromCharCode(181)+"m";
					}
					run("Set Scale...", "distance="+scale+" known=1 unit="+unit);
				}
			}
		}
				
		//PSR Analysis
		//Set which ROIs are going to be used to analyze the image
		analysisArray = newArray();
		if(PERFORM_ANALYSIS){
			if(DIFFERENTIATE_RSL){
				appendArray = newArray(30, 28, 29);
				analysisArray = Array.concat(analysisArray, appendArray);
			}
			if(DIFFERENTIATE_STRATA){
				appendArray = newArray(2, 24, 25, 14, 19, 6, 8);
				analysisArray = Array.concat(analysisArray, appendArray);
			}
			if(DIFFERENTIATE_COMBINATION){
				if(!DIFFERENTIATE_STRATA){
					appendArray = newArray(31, 33, 32, 34, 36, 35, 37, 39, 38, 14, 19, 6, 8);
					analysisArray = Array.concat(analysisArray, appendArray);
				}
				else{
					appendArray = newArray(31, 33, 32, 34, 36, 35, 37, 39, 38);
					analysisArray = Array.concat(analysisArray, appendArray);
				}
			}
		}
		else{
			analysisArray[0] = 0;
		}
		if((!DIFFERENTIATE_RSL && !DIFFERENTIATE_STRATA && !DIFFERENTIATE_COMBINATION) || (!PERFORM_ANALYSIS && !PERFORM_ANALYSIS_WITHOUT_SEGMENTATION)){
			run("Close All");
			if(warnOverlap == true){
				showMessage("Warning!", "Tissue Density was found to be greater than 100% in one or more regions. This indicates that considerable areas are being classified as collagen and parenchyma at the same time.\nThresholds for either collagen or parenchyma are too wide.\n \nPlease consider adjusting.");
			}
			showStatus("Done! ("+fromCharCode(65417, 9685, 12526, 9685)+")"+fromCharCode(65417)+"*:"+fromCharCode(12539, 12444, 10023));
			exit;
		}
		
		run("Clear Results");
		run("Set Measurements...", "integrated redirect=None decimal=3");
		if(!PERFORM_SEGMENTATION){
			thresholdArray = newArray(0);
		}
		
		//PSR Analysis proper
		if(PERFORM_ANALYSIS){
			if(!SAVE_FALSECOLOR_AS_TIFF)
				returnArrayAnalysis = PSRAnalysisCoreSegmented("", thresholdArray);
			else 
				returnArrayAnalysis = PSRAnalysisCoreSegmented("falsecolor", thresholdArray);
				
			if(SAVE_RAW_VALUES_AS_CSV){
				if(!File.exists(dir+"Results\\")){
					File.makeDirectory(dir+"Results\\");
				}
				saveAs("Results", dir+"Results\\"+folder_title+"_RAW_DATA_SEGMENTED.csv");
			}
			if(SAVE_RAW_VALUES_AS_XLSX){
				if(!File.exists(dir+"Results\\")){
					File.makeDirectory(dir+"Results\\");
				}
				run("Read and Write Excel", replace("no_count_column file=["+dir+"Results\\"+folder_title+"_RAW_VALUES_SEGMENTED.xlsx]", "\\", "/"));
			}
			
			resultCount = nResults;
			
			//Delete raw values, make results table more readable
			for(i=0; i<resultCount/2; i++){
				y=getResult("IntDen", 2*i);
				x=getResult("IntDen", 2*i+1);
				z=x/y*1000;
			
				setResult("Region", i, 0);
				if(getResult("roiarea", 2*i+1) == 0){
					setResult("Collagen Score [mCPR]", i, 0);
				}
				else{
					setResult("Collagen Score [mCPR]", i, z);
				}
				
				setResult("Area Fraction [%]", i, getResult("Area", 2*i+1) / (getResult("Area", 2*i+1)+getResult("Area", 2*i)) * 100);
				setResult("Collagen Area ["+returnArrayAnalysis[0]+fromCharCode(178)+"]", i, getResult("Area", 2*i+1));
				/*setResult("Spot Density [Spots/"+returnArrayAnalysis[0]+fromCharCode(178)+"]", i, getResult("count", 2*i+1)/(getResult("Area", 2*i+1)+getResult("Area", 2*i)));
				if(getResult("roiarea", 2*i+1) == 0){
					setResult("Spot Density [Spots/"+returnArrayAnalysis[0]+fromCharCode(178)+"]", i, 0);
				}*/
				
				setResult("Mean Collagen Intensity [%]", i, getResult("Mean", 2*i+1)/255*100);
				setResult("Max Collagen Intensity [%]", i, getResult("max", 2*i+1)/255*100);
				setResult("Mean Spot Area ["+returnArrayAnalysis[0]+fromCharCode(178)+"]", i, getResult("meanarea", 2*i+1));
				setResult("Spot Count", i, getResult("count", 2*i+1));
				if(getResult("roiarea", 2*i+1) > 0){
					tissueDensity = (getResult("Area", 2*i+1)+getResult("Area", 2*i))/getResult("roiarea", 2*i+1)*100;
					setResult("Tissue Density [%]", i, tissueDensity);
					if(tissueDensity > 100){
						warnOverlap = true;
					}
				}
				else 
					setResult("Tissue Density [%]", i, 0);
			}
			
			Table.deleteColumn("Area");
			Table.deleteColumn("Mean");
			Table.deleteColumn("IntDen");
			Table.deleteColumn("RawIntDen");
			Table.deleteColumn("max");
			Table.deleteColumn("count");
			Table.deleteColumn("meanarea");
			Table.deleteColumn("roiarea");
			
			Table.update;
			Table.deleteRows(resultCount/2, nResults-1);
			
			/*//If Spot Density is too small, rename column and multiply values by 1000
			densitySum = 0;
			for(i=0; i<nResults; i++){
				densitySum += getResult("Spot Density [Spots/"+returnArrayAnalysis[0]+fromCharCode(178)+"]", i);
			}

			if(densitySum/nResults < 0.005){
				Table.renameColumn("Spot Density [Spots/"+returnArrayAnalysis[0]+fromCharCode(178)+"]", "Spot Density [Spots/1000 "+returnArrayAnalysis[0]+fromCharCode(178)+"]");
				for(i=0; i<nResults; i++){
					setResult("Spot Density [Spots/1000 "+returnArrayAnalysis[0]+fromCharCode(178)+"]", i, 1000*getResult("Spot Density [Spots/1000 "+returnArrayAnalysis[0]+fromCharCode(178)+"]", i));
				}
			}*/
			
			//Rename rows according to differentiation pattern
			if(DIFFERENTIATE_RSL){
				setResult("Region", 0, "Total");
				setResult("Region", 1, "Right Heart (Total)");
				setResult("Region", 2, "Septum (Total)");
				setResult("Region", 3, "Left Heart (Total)");
				if(SAVE_FALSECOLOR_AS_TIFF){
					print("Total");
					print("Right Heart (Total)");
					print("Septum (Total)");
					print("Left Heart (Total)");
				}
			}
			if(DIFFERENTIATE_STRATA && !DIFFERENTIATE_RSL){
				setResult("Region", 0, "Total");
				setResult("Region", 1, "Epicardium (Total)");
				setResult("Region", 2, "Subepicardial Layer (Total)");
				setResult("Region", 3, "Myocardium (Total)");
				setResult("Region", 4, "Right Subendocardial Layer");
				setResult("Region", 5, "Left Subendocardial Layer");
				setResult("Region", 6, "Right Endocardium");
				setResult("Region", 7, "Left Endocardium");
				if(SAVE_FALSECOLOR_AS_TIFF){
					print("Total");
					print("Epicardium (Total)");
					print("Subepicardial Layer (Total)");
					print("Myocardium (Total)");
					print("Right Subendocardial Layer");
					print("Left Subendocardial Layer");
					print("Right Endocardium");
					print("Left Endocardium");
				}
			}
			if(DIFFERENTIATE_STRATA && DIFFERENTIATE_RSL){
				setResult("Region", 4, "Epicardium (Total)");
				setResult("Region", 5, "Subepicardial Layer (Total)");
				setResult("Region", 6, "Myocardium (Total)");
				setResult("Region", 7, "Right Subendocardial Layer");
				setResult("Region", 8, "Left Subendocardial Layer");
				setResult("Region", 9, "Right Endocardium");
				setResult("Region", 10, "Left Endocardium");
				if(SAVE_FALSECOLOR_AS_TIFF){
					print("Epicardium (Total)");
					print("Subepicardial Layer (Total)");
					print("Myocardium (Total)");
					print("Right Subendocardial Layer");
					print("Left Subendocardial Layer");
					print("Right Endocardium");
					print("Left Endocardium");
				}
			}
			if(DIFFERENTIATE_COMBINATION && !DIFFERENTIATE_RSL && !DIFFERENTIATE_STRATA){
				setResult("Region", 0, "Total");
				setResult("Region", 1, "Right Epicardium");
				setResult("Region", 2, "Septal Epicardium");
				setResult("Region", 3, "Left Epicardium");
				setResult("Region", 4, "Right Subepicardial Layer");
				setResult("Region", 5, "Septal Subepicardial Layer");
				setResult("Region", 6, "Left Subepicardial Layer");
				setResult("Region", 7, "Right Myocardium");
				setResult("Region", 8, "Septal Myocardium");
				setResult("Region", 9, "Left Myocardium");
				setResult("Region", 10, "Right Subendocardial Layer");
				setResult("Region", 11, "Left Subendocardial Layer");
				setResult("Region", 12, "Right Endocardium");
				setResult("Region", 13, "Left Endocardium");
				if(SAVE_FALSECOLOR_AS_TIFF){
					print("Total");
					print("Right Epicardium");
					print("Septal Epicardium");
					print("Left Epicardium");
					print("Right Subepicardial Layer");
					print("Septal Subepicardial Layer");
					print("Left Subepicardial Layer");
					print("Right Myocardium");
					print("Septal Myocardium");
					print("Left Myocardium");
					print("Right Subendocardial Layer");
					print("Left Subendocardial Layer");
					print("Right Endocardium");
					print("Left Endocardium");
				}
			}
			if(DIFFERENTIATE_COMBINATION && DIFFERENTIATE_RSL && !DIFFERENTIATE_STRATA){
				setResult("Region", 4, "Right Epicardium");
				setResult("Region", 5 , "Septal Epicardium");
				setResult("Region", 6, "Left Epicardium");
				setResult("Region", 7, "Right Subepicardial Layer");
				setResult("Region", 8, "Septal Subepicardial Layer");
				setResult("Region", 9, "Left Subepicardial Layer");
				setResult("Region", 10, "Right Myocardium");
				setResult("Region", 11, "Septal Myocardium");
				setResult("Region", 12, "Left Myocardium");
				setResult("Region", 13, "Right Subendocardial Layer");
				setResult("Region", 14, "Left Subendocardial Layer");
				setResult("Region", 15, "Right Endocardium");
				setResult("Region", 16, "Left Endocardium");
				if(SAVE_FALSECOLOR_AS_TIFF){
					print("Right Epicardium");
					print("Septal Epicardium");
					print("Left Epicardium");
					print("Right Subepicardial Layer");
					print("Septal Subepicardial Layer");
					print("Left Subepicardial Layer");
					print("Right Myocardium");
					print("Septal Myocardium");
					print("Left Myocardium");
					print("Right Subendocardial Layer");
					print("Left Subendocardial Layer");
					print("Right Endocardium");
					print("Left Endocardium");
				}
			}
			if(DIFFERENTIATE_COMBINATION && !DIFFERENTIATE_RSL && DIFFERENTIATE_STRATA){
				setResult("Region", 8, "Right Epicardium");
				setResult("Region", 9, "Septal Epicardium");
				setResult("Region", 10, "Left Epicardium");
				setResult("Region", 11, "Right Subepicardial Layer");
				setResult("Region", 12, "Septal Subepicardial Layer");
				setResult("Region", 13, "Left Subepicardial Layer");
				setResult("Region", 14, "Right Myocardium");
				setResult("Region", 15, "Septal Myocardium");
				setResult("Region", 16, "Left Myocardium");
				if(SAVE_FALSECOLOR_AS_TIFF){
					print("Right Epicardium");
					print("Septal Epicardium");
					print("Left Epicardium");
					print("Right Subepicardial Layer");
					print("Septal Subepicardial Layer");
					print("Left Subepicardial Layer");
					print("Right Myocardium");
					print("Septal Myocardium");
					print("Left Myocardium");
				}
			}
			if(DIFFERENTIATE_COMBINATION && DIFFERENTIATE_RSL && DIFFERENTIATE_STRATA){
				setResult("Region", 11, "Right Epicardium");
				setResult("Region", 12, "Septal Epicardium");
				setResult("Region", 13, "Left Epicardium");
				setResult("Region", 14, "Right Subepicardial Layer");
				setResult("Region", 15, "Septal Subepicardial Layer");
				setResult("Region", 16, "Left Subepicardial Layer");
				setResult("Region", 17, "Right Myocardium");
				setResult("Region", 18, "Septal Myocardium");
				setResult("Region", 19, "Left Myocardium");
				if(SAVE_FALSECOLOR_AS_TIFF){
					print("Right Epicardium");
					print("Septal Epicardium");
					print("Left Epicardium");
					print("Right Subepicardial Layer");
					print("Septal Subepicardial Layer");
					print("Left Subepicardial Layer");
					print("Right Myocardium");
					print("Septal Myocardium");
					print("Left Myocardium");
				}
			}
			rename(title);
			
			if(SAVE_WHITENING && !whitened_saved){
				selectWindow("Brightfield");
				saveAs("jpeg", dir+folder_title+"_Scale_whitened.jpg");
				selectWindow(title);
			}
			
			if(SAVE_PROCESSED_RESULTS_AS_CSV){
				if(!File.exists(dir+"Results\\")){
					File.makeDirectory(dir+"Results\\");
				}
				saveAs("Results", dir+"Results\\"+folder_title+"_RESULTS_SEGMENTED.csv");
			}
			if(SAVE_PROCESSED_RESULTS_AS_XLSX){
				if(!File.exists(dir+"Results\\")){
					File.makeDirectory(dir+"Results\\");
				}
				run("Read and Write Excel", replace("no_count_column file=["+dir+"Results\\"+folder_title+"_RESULTS_SEGMENTED.xlsx]", "\\", "/"));
			}
			if(SAVE_FALSECOLOR_AS_TIFF){
				logstring = getInfo("log");
				logArray = split(logstring, "\n");
				for(i=0; i<nResults; i++){
					if(i<nResults-1){
						selectWindow("ROI_"+i-1);
						rename(toString(i)+"-"+logArray[i]);
					}
					else{
						selectWindow(title);
						rename(toString(i)+"-"+logArray[i]);
					}
				}
				selectWindow("Brightfield");
				rename("0-Brightfield");
				selectWindow("Log");
				run("Close");
				selectWindow("a*");
				close;
				showStatus("!Saving False-Color Stack...");
				run("Images to Stack", "name="+folder_title+"_FALSECOLOR_SEGMENTED use");
				if(!File.exists(dir+"False_Color\\")){
					File.makeDirectory(dir+"False_Color\\");
				}
				saveAs("tiff", dir+"False_Color\\"+folder_title+"_FALSECOLOR_SEGMENTED.tif");
			}
		}
		else if(PERFORM_ANALYSIS_WITHOUT_SEGMENTATION){
			run("Clear Results");
			if(!SAVE_FALSECOLOR_AS_TIFF)
				returnArrayWO = PSRAnalysisCore("", thresholdArray);
			else 
				returnArrayWO = PSRAnalysisCore("falsecolor", thresholdArray);
				
			if(SAVE_RAW_VALUES_AS_CSV){
				if(!File.exists(dir+"Results\\"))
					File.makeDirectory(dir+"Results\\");
				
				saveAs("Results", dir+"Results\\"+folder_title+"_RAW_DATA.csv");
			}
			if(SAVE_RAW_VALUES_AS_XLSX){
				if(!File.exists(dir+"Results\\"))
					File.makeDirectory(dir+"Results\\");
					
				run("Read and Write Excel", replace("no_count_column file=["+dir+"Results\\"+folder_title+"_RAW_VALUES.xlsx]", "\\", "/"));
			}
			
			resultCount = 2;
			
			for(i=0; i<resultCount/2; i++){
				y=getResult("IntDen", 2*i);
				x=getResult("IntDen", 2*i+1);
				z=x/y*1000;
			
				setResult("Region", i, 0);
				setResult("Collagen Score [mCPR]", i, z);
				setResult("Area Fraction [%]", i, getResult("Area", 2*i+1) / (getResult("Area", 2*i+1)+getResult("Area", 2*i)) * 100);
				setResult("Collagen Area ["+returnArrayWO[0]+fromCharCode(178)+"]", i, getResult("Area", 2*i+1));
				/*setResult("Spot Density [Spots/"+returnArrayWO[0]+fromCharCode(178)+"]", i, getResult("count", 2*i+1)/(getResult("Area", 2*i+1)+getResult("Area", 2*i)));
				if(getResult("roiarea", 2*i+1) == 0){
					setResult("Spot Density [Spots/"+returnArrayWO[0]+fromCharCode(178)+"]", i, 0);
				}*/
				
				setResult("Mean Collagen Intensity [%]", i, getResult("Mean", 2*i+1)/255*100);
				setResult("Max Collagen Intensity [%]", i, getResult("max", 2*i+1)/255*100);
				setResult("Mean Spot Area ["+returnArrayWO[0]+fromCharCode(178)+"]", i, getResult("meanarea", 2*i+1));
				setResult("Spot Count", i, getResult("count", 2*i+1));
				setResult("Tissue Density [%]", i, "Only available after segmentation");
			}
			
			//Delete raw values, make results table more readable
			Table.deleteColumn("Area");
			Table.deleteColumn("Mean");
			Table.deleteColumn("IntDen");
			Table.deleteColumn("RawIntDen");
			Table.deleteColumn("max");
			Table.deleteColumn("count");
			Table.deleteColumn("meanarea");
			Table.deleteColumn("roiarea");
			Table.deleteColumn("Region");
			
			Table.update;
			Table.deleteRows(resultCount/2, nResults-1);
			
			/*//If Spot Density is too small, rename column and multiply value by 1000
			if(getResult("Spot Density [Spots/"+returnArrayWO[0]+fromCharCode(178)+"]", 0) < 0.005){
				Table.renameColumn("Spot Density [Spots/"+returnArrayWO[0]+fromCharCode(178)+"]", "Spot Density [Spots/1000 "+returnArrayWO[0]+fromCharCode(178)+"]");
				setResult("Spot Density [Spots/1000 "+returnArrayWO[0]+fromCharCode(178)+"]", 0, 1000*getResult("Spot Density [Spots/1000 "+returnArrayWO[0]+fromCharCode(178)+"]", 0));
			}*/
			if(SAVE_WHITENING && !whitened_saved){
				selectWindow("Brightfield");
				saveAs("jpeg", dir+folder_title+"_Scale_whitened.jpg");
			}
			
			if(SAVE_FALSECOLOR_AS_TIFF){
				if(!File.exists(dir+"False_Color\\")){
					File.makeDirectory(dir+"False_Color\\");
				}
		
				showStatus("!Saving False-Color Stack...");
				run("Images to Stack", "name="+folder_title+"_FALSECOLOR use");

				saveAs("tiff", dir+"False_Color\\"+folder_title+"_FALSECOLOR.tif");
			}

			rename(title);
			if(SAVE_PROCESSED_RESULTS_AS_CSV){
				if(!File.exists(dir+"Results\\")){
					File.makeDirectory(dir+"Results\\");
				}
				saveAs("Results", dir+"Results\\"+folder_title+"_RESULTS.csv");
			}
			if(SAVE_PROCESSED_RESULTS_AS_XLSX){
				run("Read and Write Excel", replace("no_count_column file=["+dir+"Results\\"+folder_title+"_RESULTS.xlsx]", "\\", "/"));
			}
		}
	
		run("Close All");
		if(warnOverlap == true){
			showMessage("Warning!", "Tissue Density was found to be greater than 100% in one or more regions. This indicates that considerable areas are being classified as collagen and parenchyma at the same time.\nThresholds for either collagen or parenchyma are too wide.\n \nPlease consider adjusting.");
		}
		showStatus("Done! ("+fromCharCode(65417, 9685, 12526, 9685)+")"+fromCharCode(65417)+"*:"+fromCharCode(12539, 12444, 10023));
	}
}	

function correctPSRBackground(){
	run("Duplicate...", "title=HSBStack");
	/*First selection of background for subsequent white balance*/
	run("HSB Stack");
	setSlice(2);
	run("Invert", "slice");
	if(CHOOSE_THRESHOLDS_MANUALLY && correctCounter == 0){
		run("Threshold...");
		setThreshold(BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD, BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD);
		waitForUser("Please adjust thresholds so that only the background is colored red.\nThe higher number represents \"BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD\", the lower one \"BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD\".");
		getThreshold(lower, upper);
		if(!File.exists(dir+"Thresholds\\")){
			File.makeDirectory(dir+"Thresholds\\");
		}
		File.saveString(lower+"\n"+upper, dir+"Thresholds\\"+"BACKGROUND_IDENTIFICATION.txt");

	}
	else if(CHOOSE_THRESHOLDS_MANUALLY && correctCounter > 0){
		backString = File.openAsString(dir+"Thresholds\\"+"BACKGROUND_IDENTIFICATION.txt");
		backLines=split(backString,"\n");
		setThreshold(backLines[0], backLines[1]);
	}
	else{
		setThreshold(BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD, BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD);
	}
	
	run("Create Selection");
	selectImage(1);
	run("Restore Selection");
	
	/*Adjustment of White Balance*/
	showStatus("Adjusting White Balance...");
	run("RGB Stack");
	title = getTitle();
	run("Set Measurements...", "mean redirect=None decimal=3");
	
	for(rgb = 0; rgb<3; rgb++){
		run("Measure");
		run("Next Slice [>]");
	}
	
	R = getResult("Mean", 0);
	G = getResult("Mean", 1);
	B = getResult("Mean", 2);
	
	Mean = (R+G+B)/3;
	
	rCorrection = Mean-R;
	gCorrection = Mean-G;
	bCorrection = Mean-B;
	
	run("Select None");
	
	/*Correcting RGB slices*/
	setSlice(1);
	getMinAndMax(min, max);
	setMinAndMax(min-rCorrection, max-rCorrection);
	run("Apply LUT", "slice");
	
	run("Next Slice [>]");
	getMinAndMax(min, max);
	setMinAndMax(min-gCorrection, max-gCorrection);
	run("Apply LUT", "slice");
	
	run("Next Slice [>]");
	getMinAndMax(min, max);
	setMinAndMax(min-bCorrection, max-bCorrection);
	run("Apply LUT", "slice");
	
	run("RGB Color");
	wait(2000);
	rename(title);
	
	run("Restore Selection");
	run("Make Inverse");
	
	/*Measuring mean color*/
	showStatus("Measuring mean color...");
	run("RGB Stack");
	title = getTitle();
	run("Set Measurements...", "mean redirect=None decimal=3");
	
	for(rgb = 0; rgb<3; rgb++){
		run("Measure");
		run("Next Slice [>]");
	}
	
	R = getResult("Mean", 3);
	G = getResult("Mean", 4);
	B = getResult("Mean", 5);
	
	run("RGB Color");
	wait(2000);
	rename(title);
	
	/*Whitening background*/
	run("Restore Selection");
	run("Make Inverse");
	setColor(255,255,255);
	run("Fill", "slice");
	run("Select None");
	selectWindow("HSBStack");
	close();
	
	if(CHOOSE_THRESHOLDS_MANUALLY && correctCounter == 0){
		return newArray(lower, upper, R, G, B);
	}
	else if(CHOOSE_THRESHOLDS_MANUALLY && correctCounter > 0){
		return newArray(backLines[0], backLines[1], R, G, B);
	}
	else{
		return newArray(R, G, B);
	}
}

function PSRAnalysisCoreSegmented(mode, thresholdArray){
	showStatus("!Analyzing...");
	run("Clear Results");
	getPixelSize(unit, pixelWidth, pixelHeight);
	originalTitle = getTitle();
	resized = false;
	returnArray = newArray(1);
	returnArray[0] = unit;
	
	getDimensions(width, height, channels, slices, frames);
	if(width*height > DECREASE_HIGH_RESOLUTION_THRESHOLD*1000000){
		run("Select None");
		factor = maxOf(width, height) / DECREASE_WIDTH_OR_HEIGHT_TO;
		
		for(i=0; i<roiManager("count"); i++){
			roiManager("select", i);
			run("Scale... ", "x="+1/factor+" y="+1/factor);
			roiManager("update");
		}
		
		run("Select None");
		showStatus("Resizing...");
		run("Scale...", "x="+1/factor+" y="+1/factor+" interpolation=None average create");
		resized = true;
		close("\\Others");
		rename(originalTitle);
	}
	
	selectImage(1);
	run("Duplicate...", "title=HSBStack");
	/*First selection of background for subsequent white balance*/
	run("HSB Stack");
	setSlice(2);
	run("Invert", "slice");
	if(CHOOSE_THRESHOLDS_MANUALLY && PERFORM_SEGMENTATION){
		setThreshold(thresholdArray[0], thresholdArray[1]);
	}
	else if(CHOOSE_THRESHOLDS_MANUALLY && !PERFORM_SEGMENTATION){
		run("Threshold...");
		setThreshold(BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD, BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD);
		waitForUser("Please adjust thresholds so that only the background is colored red.\nThe higher number represents \"BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD\", the lower one \"BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD\".");
		getThreshold(lower, upper);
		if(!File.exists(dir+"Thresholds\\")){
			File.makeDirectory(dir+"Thresholds\\");
		}
		File.saveString(lower+"\n"+upper, dir+"Thresholds\\"+"BACKGROUND_IDENTIFICATION.txt");
	}
	else{
		setThreshold(BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD, BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD);
	}
	run("Create Selection");
	selectImage(1);
	run("Restore Selection");
	
	/*Adjustment of White Balance*/
	showStatus("!Adjusting White Balance...");
	run("RGB Stack");
	title = getTitle();
	run("Set Measurements...", "mean redirect=None decimal=3");
	
	for(rgb = 0; rgb<3; rgb++){
		run("Measure");
		run("Next Slice [>]");
	}
	
	R = getResult("Mean", 0);
	G = getResult("Mean", 1);
	B = getResult("Mean", 2);
	
	Mean = (R+G+B)/3;
	
	rCorrection = Mean-R;
	gCorrection = Mean-G;
	bCorrection = Mean-B;
	
	run("Select None");
	
	/*Correcting RGB slices*/
	setSlice(1);
	getMinAndMax(min, max);
	setMinAndMax(min-rCorrection, max-rCorrection);
	run("Apply LUT", "slice");
	
	run("Next Slice [>]");
	getMinAndMax(min, max);
	setMinAndMax(min-gCorrection, max-gCorrection);
	run("Apply LUT", "slice");
	
	run("Next Slice [>]");
	getMinAndMax(min, max);
	setMinAndMax(min-bCorrection, max-bCorrection);
	run("Apply LUT", "slice");
	
	run("RGB Color");
	rename(title);
	
	/*Whitening background*/
	run("Restore Selection");
	setColor(255,255,255);
	run("Fill", "slice");
	run("Select None");
	rename("Brightfield");
	
	//Create Master Lab-Stack
	showStatus("!Creating Master L*a*b* Stack...");
	run("Duplicate...", "title=L*a*b* Stack");
	run("Lab Stack");
	run("Stack to Images");
	selectWindow("L*");
	close();
	selectWindow("b*");
	close();
	showStatus("!Analyzing...");
	run("Clear Results");
	run("Restore Selection");
	setColor(0,0,0);
	run("Fill", "slice");
	
	run("Set Measurements...", "mean area integrated redirect=None decimal=3");

	for(i=-1; i<analysisArray.length; i+=1){
		//Select Cardiomyocytes in Hue channel, excluding collagen
		showStatus("!Analyzing region "+i+2+"/"+analysisArray.length+1+"...");
		selectWindow("Brightfield");
		run("Duplicate...", "title=BF_"+i);
		if(i>-1){
			roiManager("select", analysisArray[i]);
			roiManager("measure");
			if(matches(Roi.getName, ".*(-\\(Empty\\)).*")){
				roiManager("deselect");
				makeRectangle(0, 0, 1, 1);
			}
			run("Make Inverse");
			setForegroundColor(255,255,255);
			run("Fill", "slice");
		}
		else{
			roiManager("select", newArray(28,29,30)); //**NEU --- NICHT GETESTET**//
			roiManager("or");
			roiManager("add");
			roiManager("deselect");
			roiManager("select", 40);
			roiManager("rename", "40-HeartArea");
			roiManager("measure");
		}
		run("Select None");
		selectWindow("BF_"+i);
		run("HSB Stack");
		rename("HSB_"+i);
		if(CHOOSE_THRESHOLDS_MANUALLY && i==-1){
			run("Threshold...");
			setThreshold(PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD, PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD);
			waitForUser("Please adjust thresholds so that only the myocardium, not the collagen is colored red.\nThe higher number represents \"PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD\", the lower one \"PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD\".");
			getThreshold(cardLower, cardUpper);
			if(!File.exists(dir+"Thresholds\\")){
				File.makeDirectory(dir+"Thresholds\\");
			}
			File.saveString(cardLower+"\n"+cardUpper, dir+"Thresholds\\"+"PARENCHYMA_IDENTIFICATION.txt");
		}
		else if(!CHOOSE_THRESHOLDS_MANUALLY){
			setThreshold(PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD, PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD);
		}
		else{
			setThreshold(cardLower, cardUpper);
		}

		run("Create Selection");
		resetThreshold();
		run("Select None");
		
		//Measure area and mean saturation of cardiomyocytes (higher saturation -> brighter)
		setSlice(2);
		run("Restore Selection");
		run("Measure");
		run("Select None");
		
		//Select collagen in a*-channel
		selectWindow("a*");
		run("Duplicate...", "title=a*_"+i);
		if(i>-1){
			roiManager("select", analysisArray[i]);
			if(matches(Roi.getName, ".*(-\\(Empty\\)).*")){
				roiManager("deselect");
				makeRectangle(0, 0, 1, 1);
			}
			run("Make Inverse");
			setForegroundColor(0,0,0);
			run("Fill", "slice");
		}
		run("Select None");
		getStatistics(area, mean, min, max, std, histogram);
		
		if(CHOOSE_THRESHOLDS_MANUALLY && i==-1){
			run("Threshold...");
			setThreshold(COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD, COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD);
			waitForUser("Please adjust thresholds so that only the collagen is colored red.\nThe higher number represents \"COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD\", the lower one \"COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD\".");
			getThreshold(collLower, collUpper);
			if(toString(collUpper) == "1.0000E30")
				collUpper = 100;
			if(!File.exists(dir+"Thresholds\\")){
				File.makeDirectory(dir+"Thresholds\\");
			}
			File.saveString(collLower+"\n"+collUpper, dir+"Thresholds\\"+"COLLAGEN_IDENTIFICATION.txt");
		}
		if(!CHOOSE_THRESHOLDS_MANUALLY){
			if(max >= COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD){
				setThreshold(COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD, COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD);
				run("Create Selection");
				run("Create Mask");
				table1 = nResults;
				run("Analyze Particles...", "display include");
				table2 = nResults;
				diff = table2 - table1;
				
				areasum = 0;
				for(line = table1; line < table2; line++){
					areasum += getResult("Area", line);
				}
				meanarea = areasum / diff;
				selectWindow("Results");
				Table.deleteRows(table1, table2);
				close();
				//Measure area and saturation in saturation channel
				selectWindow("HSB_"+i);
				run("Restore Selection");
				getStatistics(area, mean, min, max, std, histogram);
				run("Measure");
				selectWindow("Results");
				setResult("max", 2*(i+1)+2, max);
				setResult("count", 2*(i+1)+2, diff);
				setResult("meanarea", 2*(i+1)+2, meanarea);
				setResult("roiarea", 2*(i+1)+2, getResult("Area", 2*(i+1)));
				Table.deleteRows(2*(i+1), 2*(i+1));
				selectWindow("Results");
				Table.update;
			} 
			else{
				run("Measure");
				setResult("Mean", 2*(i+1)+2, 0);
				setResult("Area", 2*(i+1)+2, 0);
				setResult("IntDen", 2*(i+1)+2, 0);
				setResult("RawIntDen", 2*(i+1)+2, 0);
				setResult("max", 2*(i+1)+2, 0);
				setResult("count", 2*(i+1)+2, 0);
				setResult("meanarea", 2*(i+1)+2, 0);
				setResult("roiarea", 2*(i+1)+2, 0);
				Table.deleteRows(2*(i+1), 2*(i+1));
				
				table_headings = Table.headings;
				table_headings_array = split(table_headings, "\t");
				
				for(j=0; j<table_headings_array.length; j++){
					if(table_headings_array[j] == "X"){
						Table.deleteColumn("X");
					}	
					if(table_headings_array[j] == "Y"){
						Table.deleteColumn("Y");
					}
				}
			}
		}
		else{
			if(max >= collLower){
				setThreshold(collLower, collUpper);
				run("Create Selection");
				run("Create Mask");
				table1 = nResults;
				run("Analyze Particles...", "display include");
				table2 = nResults;
				diff = table2 - table1;
				
				areasum = 0;
				for(line = table1; line < table2; line++){
					areasum += getResult("Area", line);
				}
				meanarea = areasum / diff;
				selectWindow("Results");
				Table.deleteRows(table1, table2);
				close();
				//Measure area and saturation in saturation channel
				selectWindow("HSB_"+i);
				run("Restore Selection");
				getStatistics(area, mean, min, max, std, histogram);
				run("Measure");
				selectWindow("Results");
				setResult("max", 2*(i+1)+2, max);
				setResult("count", 2*(i+1)+2, diff);
				setResult("meanarea", 2*(i+1)+2, meanarea);
				setResult("roiarea", 2*(i+1)+2, getResult("Area", 2*(i+1)));
				Table.deleteRows(2*(i+1), 2*(i+1));
				selectWindow("Results");
				Table.update;
			} 
			else{
				run("Measure");
				setResult("Mean", 2*(i+1)+2, 0);
				setResult("Area", 2*(i+1)+2, 0);
				setResult("IntDen", 2*(i+1)+2, 0);
				setResult("RawIntDen", 2*(i+1)+2, 0);
				setResult("max", 2*(i+1)+2, 0);
				setResult("count", 2*(i+1)+2, 0);
				setResult("meanarea", 2*(i+1)+2, 0);
				setResult("roiarea", 2*(i+1)+2, 0);
				Table.deleteRows(2*(i+1), 2*(i+1));
				
				table_headings = Table.headings;
				table_headings_array = split(table_headings, "\t");
								
				for(j=0; j<table_headings_array.length; j++){
					if(table_headings_array[j] == "X"){
						Table.deleteColumn("X");
					}	
					if(table_headings_array[j] == "Y"){
						Table.deleteColumn("Y");
					}
				}
			}			
		}
		if(mode == "falsecolor"){
			selectWindow("a*_"+i);
			run("Fire");
			if(CHOOSE_THRESHOLDS_MANUALLY){
				setThreshold(collLower, 100);
			}
			else{
				setThreshold(COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD, 100);
			}
			run("Create Selection");
			run("Make Inverse");
			setColor(0, 0, 0);
			run("Fill", "slice");
			resetThreshold();
			selectWindow("HSB_"+i);
			run("Stack to Images");
			selectWindow("Hue");
			close();
			selectWindow("Brightness");
			close();
			run("RGB Color");
			selectWindow("Saturation");
			imageCalculator("Transparent-zero create", "Saturation","a*_"+i);
			selectWindow("a*_"+i);
			close();
			selectWindow("Saturation");
			close();
			if(isOpen(folder_title+"_Scale.jpg")){
				close();		
			}
			rename("ROI_"+i);
		}
		
		if(isOpen("a*_"+i)){
			selectWindow("a*_"+i);
			close();
		}
		if(isOpen("BF_"+i)){
			selectWindow("BF_"+i);
			close();
		}
	}
	return returnArray;
}

function PSRAnalysisCore(mode, thresholdArray){
	showStatus("!Analyzing...");
	run("Clear Results");
	getPixelSize(unit, pixelWidth, pixelHeight);
	originalTitle = substring(getTitle(), 0, lengthOf(getTitle())-4);
	resized = false;
	returnArray = newArray(1);
	returnArray[0] = unit;
	
	getDimensions(width, height, channels, slices, frames);
	if(width*height > DECREASE_HIGH_RESOLUTION_THRESHOLD*1000000){
		run("Select None");
		factor = maxOf(width, height) / DECREASE_WIDTH_OR_HEIGHT_TO;
		
		for(i=0; i<roiManager("count"); i++){
			roiManager("select", i);
			run("Scale... ", "x="+1/factor+" y="+1/factor);
			roiManager("update");
		}
		
		run("Select None");
		showStatus("Resizing...");
		run("Scale...", "x="+1/factor+" y="+1/factor+" interpolation=None average create");
		resized = true;
		close("\\Others");
		rename(originalTitle);
	}
	
	selectImage(1);
	run("Duplicate...", "title=HSBStack");
	/*First selection of background for subsequent white balance*/
	run("HSB Stack");
	setSlice(2);
	run("Invert", "slice");
	if(CHOOSE_THRESHOLDS_MANUALLY){
		if(thresholdArray.length > 0)
			setThreshold(thresholdArray[0], thresholdArray[1]);
		else{
			run("Threshold...");
			setThreshold(BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD, BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD);
			waitForUser("Please adjust thresholds so that only the background is colored red.\nThe higher number represents \"BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD\", the lower one \"BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD\".");
			getThreshold(lower, upper);
			if(!File.exists(dir+"Thresholds\\")){
				File.makeDirectory(dir+"Thresholds\\");
			}
			File.saveString(lower+"\n"+upper, dir+"Thresholds\\"+"BACKGROUND_IDENTIFICATION.txt");
		}	
	}
	else{
		setThreshold(BACKGROUND_IDENTIFICATION_LOWER_THRESHOLD, BACKGROUND_IDENTIFICATION_UPPER_THRESHOLD);
	}
	
	run("Create Selection");
	selectImage(1);
	run("Restore Selection");
	
	/*Adjustment of White Balance*/
	showStatus("!Adjusting White Balance...");
	run("RGB Stack");
	title = getTitle();
	run("Set Measurements...", "mean redirect=None decimal=3");
	
	for(rgb = 0; rgb<3; rgb++){
		run("Measure");
		run("Next Slice [>]");
	}
	
	R = getResult("Mean", 0);
	G = getResult("Mean", 1);
	B = getResult("Mean", 2);
	
	Mean = (R+G+B)/3;
	
	rCorrection = Mean-R;
	gCorrection = Mean-G;
	bCorrection = Mean-B;
	
	run("Select None");
	
	/*Correcting RGB slices*/
	setSlice(1);
	getMinAndMax(min, max);
	setMinAndMax(min-rCorrection, max-rCorrection);
	run("Apply LUT", "slice");
	
	run("Next Slice [>]");
	getMinAndMax(min, max);
	setMinAndMax(min-gCorrection, max-gCorrection);
	run("Apply LUT", "slice");
	
	run("Next Slice [>]");
	getMinAndMax(min, max);
	setMinAndMax(min-bCorrection, max-bCorrection);
	run("Apply LUT", "slice");
	
	run("RGB Color");
	rename(title);
	
	/*Whitening background*/
	run("Restore Selection");
	setColor(255,255,255);
	run("Fill", "slice");
	run("Select None");
	rename("Brightfield");;
	
	//Create Lab-Stack
	showStatus("!Creating L*a*b* Stack...");
	run("Duplicate...", "title=L*a*b* Stack");
	run("Lab Stack");
	run("Stack to Images");
	selectWindow("L*");
	close();
	selectWindow("b*");
	close();
	showStatus("!Analyzing...");
	run("Clear Results");
	run("Restore Selection");
	setColor(0,0,0);
	run("Fill", "slice");
	
	run("Set Measurements...", "mean area integrated redirect=None decimal=3");
	selectWindow("HSBStack");
	close();

	//Select Cardiomyocytes in Hue channel, excluding collagen
	selectWindow("Brightfield");
	run("Select None");
	run("Duplicate..." , "title=HSBStack");
	run("HSB Stack");

	if(CHOOSE_THRESHOLDS_MANUALLY){
		run("Threshold...");
		setThreshold(PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD, PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD);
		waitForUser("Please adjust thresholds so that only the myocardium, not the collagen is colored red.\nThe higher number represents \"PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD\", the lower one \"PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD\".");
		getThreshold(cardLower, cardUpper);
		
		if(!File.exists(dir+"Thresholds\\")){
			File.makeDirectory(dir+"Thresholds\\");
		}
		File.saveString(cardLower+"\n"+cardUpper, dir+"Thresholds\\"+"PARENCHYMA_IDENTIFICATION.txt");
	}
	else if(!CHOOSE_THRESHOLDS_MANUALLY){
		setThreshold(PARENCHYMA_IDENTIFICATION_LOWER_THRESHOLD, PARENCHYMA_IDENTIFICATION_UPPER_THRESHOLD);
	}

	run("Create Selection");
	resetThreshold();
	run("Select None");
	
	//Measure area and mean saturation of cardiomyocytes (higher saturation -> brighter)
	setSlice(2);
	run("Restore Selection");  

	run("Measure");
	run("Select None");
	
	selectWindow("a*");
	run("Select None");
	getStatistics(area, mean, min, max, std, histogram);
	
	if(CHOOSE_THRESHOLDS_MANUALLY){
		run("Threshold...");
		setThreshold(COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD, COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD);
		waitForUser("Please adjust thresholds so that only the collagen is colored red.\nThe higher number represents \"COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD\", the lower one \"COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD\".");
		getThreshold(collLower, collUpper);
		if(toString(collUpper) == "1.0000E30")
			collUpper = 100;
		if(!File.exists(dir+"Thresholds\\")){
			File.makeDirectory(dir+"Thresholds\\");
		}
		File.saveString(collLower+"\n"+collUpper, dir+"Thresholds\\"+"COLLAGEN_IDENTIFICATION.txt");
	}
	else{
		collLower = -10; //This is just so that the next if-Statement works
	}
	
	if(max >= COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD || max >= collLower){
		if(CHOOSE_THRESHOLDS_MANUALLY)
			setThreshold(collLower, collUpper);
		else
			setThreshold(COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD, COLLAGEN_IDENTIFICATION_UPPER_THRESHOLD);
		run("Create Selection");
		run("Create Mask");
		table1 = nResults;
		run("Analyze Particles...", "display include");
		table2 = nResults;
		diff = table2 - table1;
		
		areasum = 0;
		for(line = table1; line < table2; line++){
			areasum += getResult("Area", line);
		}
		meanarea = areasum / diff;
		selectWindow("Results");
		Table.deleteRows(table1, table2);
		close();
		selectWindow("HSBStack");
		run("Select None");
		resetThreshold();
		run("Restore Selection");
		getStatistics(area, mean, min, max, std, histogram);
		run("Measure");
		setResult("max", 1, max);
		setResult("count", 1, diff);
		setResult("meanarea", 1, meanarea);
		setResult("roiarea", 1, getResult("Area", 1)+getResult("Area", 0));
		selectWindow("Results");
		Table.update;
	}
	else{
		run("Measure");
		setResult("Mean", 1, 0);
		setResult("Area", 1, 0);
		setResult("IntDen", 1, 0);
		setResult("RawIntDen", 1, 0);
		setResult("max", 1, 0);
		setResult("count", 1, 0);
		setResult("meanarea", 1, 0);
		setResult("roiarea", 1, 0);
	}
	
	if(mode == "falsecolor"){
		selectWindow("a*");
		run("Fire");
		if(CHOOSE_THRESHOLDS_MANUALLY){
			setThreshold(collLower, 100);
		}
		else{
			setThreshold(COLLAGEN_IDENTIFICATION_LOWER_THRESHOLD, 100);
		}
		run("Create Selection");
		run("Make Inverse");
		setColor(0, 0, 0);
		run("Fill", "slice");
		resetThreshold();
		selectWindow("HSBStack");
		run("Stack to Images");
		selectWindow("Hue");
		close();
		selectWindow("Brightness");
		close();
		selectWindow("Saturation");
		run("RGB Color");
		imageCalculator("Transparent-zero create", "Saturation","a*");
		selectWindow("a*");
		close();
		selectWindow("Saturation");
		close();
		if(isOpen(folder_title+"_Scale.jpg")){
			close();		
		}
		rename("FALSECOLOR");
	}

	return returnArray;
}

function printArray(arr){
	print(
	for(i=0; i<arr.length; i++){
		print(i+": "+arr[i]);
	}
}

function isPointWithinImageBoundaries(x, y){ //WARNING! Will delete selection, if present
	run("Select None");
	getDimensions(width, height, channels, slices, frames);
	if(x >= 0 && x <= width && y >= 0 && y <= height)
		return true;
	else 
		return false;
}

function removeTempROIs(){
	roiManager("deselect");
	count = roiManager("count");
	
	for(i = count-1; i>=0; i--){
		roiManager("select", i);
		name = Roi.getName;
		if(matches(name, ".*(temp).*")){
			roiManager("delete");
		}
	}
}

function findIndexOfHighest(array){
	Array.getStatistics(array, min, max, mean, stdDev);
	
	for(j=0;j<array.length; j++){
		if(max == array[j]){
			index = j;
		}
	}
	return index;
}

function getAngle(x1, y1, x2, y2){
	G = y2-y1;
	A = x2-x1;
	
	angle = atan(G/A);
	return deg(angle);
}

function getAngleProper(x1, y1, x2, y2){
	if(y2 > y1 && x2 > x1){
		A = x1-x2;
		G = y2-y1;
		angle = atan(G/A);
	}
	else if(y2 > y1 && x2 < x1){
		A = x2-x1;
		G = y1-y2;
		angle = atan(G/A)-PI;
	}
	else if(y2 < y1 && x2 > x1){
		A = x1-x2;
		G = y2-y1;
		angle = atan(G/A);
	}
	else if(y2 < y1 && x2 < x1){
		A = x2-x1;
		G = y1-y2;
		angle = atan(G/A)-PI;
	}
	else if(y1 == y2 && x1 < x2){
		angle = 0;
	}
	else if(y1 == y2 && x1 > x2){
		angle = PI;
	}
	else if(x1 == x2 && y1 < y2){
		angle = PI*(-1)/2;
	}
	else if(x1 == x2 && y1 > y2){
		angle = PI/2;
	}
	else{
		angle = 0;
	}
	
	//print("Pre-adjustment: "+deg(angle));

	if(angle > PI){
		angle -= PI;
		angle *= -1;
	}
	else if(angle < PI*(-1)){
		angle += 2*PI;
	}

	return deg(angle);
}

function getAngleDifference(angle1, angle2){
	if(angle1-angle2 >= 180){
		angleDifference = angle1-angle2-360;
	}
	else if(angle1-angle2 <= -180){
		angleDifference = angle1-angle2+360;
	}
	else{
		angleDifference = angle1-angle2;
	}	
	
	return angleDifference;	
}

function deg(radians){
	return (radians*360)/(2*PI);
}

function rad(degrees){
	return (degrees/360)*2*PI;
}

function makeLineAngle(originX, originY, angle, length, drawResultingLine, lineWidth){
	angle = rad(angle);
	H = length / 2;
	A = H * cos(angle);
	G = H * sin(angle);
	
	x1 = originX - A;
	y1 = originY - G;
	x2 = originX + A;
	y2 = originY + G;

	makeLine(x1, y1, x2, y2);
	if(drawResultingLine){
		setLineWidth(lineWidth);
		drawLine(x1, y1, x2, y2);
	}
	
	returnArray = newArray(x1,y1,x2,y2);
	return returnArray;
}

function makeLineAngleFromX1(x1, y1, angle, length, drawResultingLine, lineWidth){
	angle = rad(-1*angle);
	H = length;
	A = H * cos(angle);
	G = H * sin(angle);
	 
	x2 = x1 + A;
	y2 = y1 + G;

	makeLine(x1, y1, x2, y2);
	if(drawResultingLine){
		setLineWidth(lineWidth);
		drawLine(x1, y1, x2, y2);
	}
	
	returnArray = newArray(x1,y1,x2,y2);
	return returnArray;
}

function getIntersectionPoint(x1, y1, x2, y2, x3, y3, x4, y4){
	px = ((x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4))/((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
	py = ((x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4))/((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
	
	return newArray(px, py);
}

function constructEllipse(major, minor, angle, centroidX, centroidY){
	aspectRatio = minor / major;
	G = sin(rad(360-90-angle))*major/2;
	A = cos(rad(360-90-angle))*major/2;
	
	x1 = centroidX - G;
	y1 = centroidY + A;
	x2 = centroidX + G;
	y2 = centroidY - A;
	
	makeEllipse(x1, y1, x2, y2, aspectRatio);
}

function getArrayIndex(array, value){
	for(i=0; i<array.length; i++){
		if(array[i] == value){
			return i;
		}
		else if(array[i] != value && i == array.length-1){
			return NaN;
		}
	}
}

function summarizeArray(array){
	sum = 0;
	for(i=0; i<array.length; i++){
		sum+= array[i];
	}
	return sum;
}

function getPointDistance(x1, y1, x2, y2){
	return sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
}

function getPointOnLineFromOrigin(originX, originY, angle, length, segment, select){
	angle = rad(angle);
	H = length / 2;
	A = H * cos(angle);
	G = H * sin(angle);
	
	x1 = originX - A;
	y1 = originY - G;
	
	H = segment * length;
	A = H * cos(angle);
	G = H * sin(angle);
	
	returnArray = newArray(2);
	returnArray[0] = x1+A;
	returnArray[1] = y1+G;
	
	if(select)
		makePoint(returnArray[0], returnArray[1]);
	
	return returnArray;
}

function getPointOnLineFromX1(x1, y1, angle, length, segment, select){
	angle = rad(-1*angle);
	H = length / 2;
	A = H * cos(angle);
	G = H * sin(angle);
	
	H = segment * length;
	A = H * cos(angle);
	G = H * sin(angle);
	
	returnArray = newArray(2);
	returnArray[0] = x1+A;
	returnArray[1] = y1+G;
	
	if(select)
		makePoint(returnArray[0], returnArray[1]);
	
	return returnArray;
}

function drawPerpendicularLine(x1,y1,x2,y2, drawResultingLine, lineWidth){
	angle = getAngle(x1, y1, x2, y2);
	
	originX = x1-((x1-x2)/2);
	originY = y1-((y1-y2)/2);
	
	return makeLineAngle(originX, originY, angle+90, 5000, drawdrawResultingLine, lineWidth);
}

function createRVLumenBisector(roi, x1,y1,x2,y2){
	getDimensions(width, height, channels, slices, frames);
	pointArrayX = newArray();
	pointArrayY = newArray();
	run("Set Measurements...", "centroid redirect=None decimal=3");
	run("Clear Results");
	
	roiManager("deselect");
	roiManager("select", roi);
	roiManager("measure");
	
	centroidX = getResult("X", 0);
	centroidY = getResult("Y", 0);
	
	distance1 = getPointDistance(x1, y1, centroidX, centroidY);
	distance2 = getPointDistance(x2, y2, centroidX, centroidY);
	
	if(distance1 < distance2){
		pivotPoint = newArray(x2,y2);
		movingPoint = newArray(x1,y1);
	}
	else{
		pivotPoint = newArray(x1,y1);
		movingPoint = newArray(x2,y2);
	}
	
	angle = getAngleProper(pivotPoint[0], pivotPoint[1], movingPoint[0], movingPoint[1]);
	
	entrancePoint = newArray();
	exitPoint = newArray();
	lookForExit = false;
	exitFound = false;
	roiManager("deselect");
	roiManager("select", roi);
	setForegroundColor(0,0,0);
	
	ray_length = sqrt(Math.sqr(width)+Math.sqr(height));
	
	for(i=-80; i<=80; i+=1){ 
		makeLineAngleFromX1(pivotPoint[0], pivotPoint[1], angle-i, ray_length, true, 2);
		lookForExit = false;
		exitFound = false;
		
		for(j=0; j<=5000; j+=5){
			currpoint = newArray(2);
			currPoint = getPointOnLineFromX1(pivotPoint[0], pivotPoint[1], angle-i, 3000, j/3000, false);

			if(exitFound){
				break;
			}
			if(!lookForExit){
				roiManager("select", roi);
				if(Roi.contains(currPoint[0], currPoint[1])){
					pointArrayX[pointArrayX.length] = currPoint[0];
					pointArrayY[pointArrayY.length] = currPoint[1];
					fillOval(currPoint[0]-7.5, currPoint[1]-7.5, 15, 15);
					break;
				}
			}
			/*else if(lookForExit){
				if(!Roi.contains(currPoint[0], currPoint[1])){
					exitPoint[0] = currPoint[0];
					exitPoint[1] = currPoint[1];
					print("Ex: "+exitPoint[0]+", "+exitPoint[1]);
					exitFound = true;
					fillOval(exitPoint[0], exitPoint[1], 15, 15);
				}
			}*/
		}
	}
	
	combinedArray = Array.concat(pointArrayX, pointArrayY);
	return combinedArray;
}

function createLVLumenBisector(roi, x1,y1,x2,y2){
	getDimensions(width, height, channels, slices, frames);
	pointArrayX = newArray();
	pointArrayY = newArray();
	run("Set Measurements...", "centroid redirect=None decimal=3");
	run("Clear Results");
	
	roiManager("deselect");
	roiManager("select", roi);
	roiManager("measure");
	
	centroidX = getResult("X", 0);
	centroidY = getResult("Y", 0);
	
	distance1 = getPointDistance(x1, y1, centroidX, centroidY);
	distance2 = getPointDistance(x2, y2, centroidX, centroidY);
	
	if(distance1 > distance2){
		pivotPoint = newArray(x2,y2);
		movingPoint = newArray(x1,y1);
	}
	else{
		pivotPoint = newArray(x1,y1);
		movingPoint = newArray(x2,y2);
	}
	
	angle = getAngleProper(pivotPoint[0], pivotPoint[1], movingPoint[0], movingPoint[1]);
	
	entrancePoint = newArray();
	exitPoint = newArray();
	lookForExit = false;
	exitFound = false;
	roiManager("deselect");
	roiManager("select", roi);
	setForegroundColor(0,0,0);
	
	ray_length = sqrt(Math.sqr(width)+Math.sqr(height));
	
	for(i=-80; i<=80; i+=1){ 
		makeLineAngleFromX1(pivotPoint[0], pivotPoint[1], angle-i, ray_length, false, 2);
		lookForExit = false;
		exitFound = false;
		
		for(j=0; j<=5000; j+=5){
			currpoint = newArray(2);
			currPoint = getPointOnLineFromX1(pivotPoint[0], pivotPoint[1], angle-i, 3000, j/3000, false);

			if(exitFound){
				break;
			}
			if(!lookForExit){
				roiManager("select", roi);
				if(!Roi.contains(currPoint[0], currPoint[1])){
					pointArrayX[pointArrayX.length] = currPoint[0];
					pointArrayY[pointArrayY.length] = currPoint[1];
					fillOval(currPoint[0]-7.5, currPoint[1]-7.5, 15, 15);
					break;
				}
			}
			
			/*else if(lookForExit){
				if(!Roi.contains(currPoint[0], currPoint[1])){
					exitPoint[0] = currPoint[0];
					exitPoint[1] = currPoint[1];
					print("Ex: "+exitPoint[0]+", "+exitPoint[1]);
					exitFound = true;
					fillOval(exitPoint[0], exitPoint[1], 15, 15);
				}
			}*/
		}
	}
	
	combinedArray = newArray();
	combinedArray = Array.concat(pointArrayX, pointArrayY);
	return combinedArray;
}

function getROIOverlapDegree(roi1, roi2){
	roiManager("deselect");
	roiManager("select", roi2);
	Roi.getContainedPoints(xpoints1, ypoints1);
	roiManager("deselect");
	roiManager("select", roi1);
	overlaps = 0;
	
	for(i=0; i<xpoints1.length; i+=1000){
		if(Roi.contains(xpoints1[i], ypoints1[i])){
			overlaps++;
		}
	}
	return overlaps / xpoints1.length * 1000;
}

function createStripedPattern(windowTitle, width, height, lineNumber, pattern, blurIntensity){
	newImage(windowTitle, "8-bit white", width, height, 1);
	diameter = sqrt(Math.sqr(width)+Math.sqr(height));
	
	setForegroundColor(0,0,0);
	setLineWidth(width/lineNumber/5);
	if(pattern=="horizontal")
		lineNumber/=sqrt(0.75);
	
	for(i=0; i<width*2; i+=height/lineNumber){
		if(pattern == "left")
			makeLineAngleFromX1(i, 0, -120, diameter, true, width/lineNumber/5);
		if(pattern == "right")
			makeLineAngleFromX1(i-width, 0, 300, diameter, true, width/lineNumber/5);
		if(pattern == "crossed"){
			makeLineAngleFromX1(i, 0, -120, diameter, true, width/lineNumber/5);
			makeLineAngleFromX1(i-width, 0, 300, diameter, true, width/lineNumber/5);
		}
		if(pattern == "horizontal"){
			makeLineAngleFromX1(0, i+(height/lineNumber/2), 0, diameter, true, width/lineNumber/5);
		}
		if(pattern == "vertical"){
			makeLineAngleFromX1(i, 0, -90, diameter, true, width/lineNumber/5);
		}
		if(pattern == "triple"){
			makeLineAngleFromX1(i, 0, -120, diameter, true, width/lineNumber/5);
			makeLineAngleFromX1(i-width, 0, 300, diameter, true, width/lineNumber/5);
			makeLineAngleFromX1(0, i, 0, diameter, true, width/lineNumber/5);
		}
	}
		run("Gaussian Blur...", "sigma="+blurIntensity/lineNumber);
		run("Select None");
}

function WhiteningCore(overrideFile, colorFile, colorArray, invertFile){
	run("Set Scale...", "distance=0 known=0 unit=pixel");
	run("Duplicate...", " ");
	
	if(!overrideFile){
		Dialog.create("Scalebar");
		items = newArray("Yes", "No");
		Dialog.addRadioButtonGroup("Scalebar present?", items, 1, 2, "Yes");
		Dialog.show();
		if(Dialog.getRadioButton() == "Yes"){
			setTool(8);
			run("Wand Tool...", "tolerance=22 mode=Legacy");
			waitForUser("Please click on scalebar.");
			run("Set Measurements...", "bounding redirect=None decimal=3");
			run("Measure");
			ScalebarX = getResult("BX", 0);
			ScalebarY = getResult("BY", 0);
			ScalebarW = getResult("Width", 0);
			ScalebarH = getResult("Height", 0);
			Scalebar = true;
			returnArray = newArray(ScalebarX, ScalebarY, ScalebarW, ScalebarH);
		}
		else{
			returnArray = newArray(0,0,0,0);
		}
	}
	else{
		returnArray = newArray(0,0,0,0);
	}
	
	run("HSB Stack");
	run("Stack to Images");
	close();
	setThreshold(0, 35);
	run("Convert to Mask");
	run("Create Selection");
	selectImage(1);
	run("Restore Selection");
	if(invertFile){
		run("Make Inverse");
	}
	if(!colorFile){
		setColor(255,255,255);
		showStatus("!Whitening, please wait...");
	}
	else{
		setColor(colorArray[0], colorArray[1], colorArray[2]);
		showStatus("!Coloring, please wait...");
	}
	run("Fill", "slice");
	run("Select None");
	
	return returnArray;
}
