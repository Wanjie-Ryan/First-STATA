

	// Purpose						: Training Wanjie Ryan 
	// Created by 					: Anthony Mwangi
	// Date 						: 31 January 2022
	// Datasets required 		    : Dummy_data.xls
	// Outputs 						: "PMA_Training_TUM_31012022.dta"

	// Enable line wrapping

	//wrap

	//	Step 1:	Set a working directory
	//View current working directory
		pwd

	//	cd stands for 'change directory' - Copy path to this folder in your machine "Day 1 - Hands on practice"
		cd "E:\Programming\Stata\ICRHK-Practice data"


	//	Step 2: Import data- excel file
	import excel "E:\Programming\Stata\ICRHK-Practice data\Dummy_data.xls", sheet("Sheet1") firstrow clear


	//	Renaming variables 

	rename EA Enum_Area
	rename FQ_age F_Age
	rename FQmarital_status F_Marital_Status
	rename cp Contraceptive
	rename mcp male_cp
	rename age_at_first_use Age_at_first_use
	rename have_insurance_yn have_Insurance
	rename used_insurance_fp_mch used_Insurance
	rename age_at_first_sex age_at_first_sex

		
	//	Step 3: Look at your Data
	//	The first thing we might want to do is to make sure we have loaded the right file, and to get a rough idea of its components

	//displays the variables named VAR1, VAR2.

	list Enum_Area F_Age

	// edit

	//edit A B

	//browse A B


	//displays the first 10 observations of all the variables in the data set.

	list Enum_Area F_Age school F_Marital_Status Contraceptive male_cp current_method Age_at_first_use have_Insurance used_Insurance age_at_first_sex if _n >= 1 & _n <11

	//	Step 3b: To look at your data, type browse

// 	browse

			edit



	//	Step --: Clean Data




	//	Step 4: Going yet further, we may be interested in summary statistics about the data:			


	//	Label data
	label data "ryan-practice-data w Antony"



	//	Label variables 
	
	label variable Enum_Area "Enumaration area"
	label variable F_Age "Age of the female participant"
	label variable F_Marital_Status "marital status of the female"
	label variable Contraceptive "contraceptive used"
	label variable male_cp "male contraceptive"
	label variable Age_at_first_use "Age participant first used contraceptives "
	label variable have_Insurance "does participant has insurance?"
	label variable used_Insurance "has participant ever used an insurance"
	label variable age_at_first_sex "age participant had sex"


	// defining a value label
	
		label define marital_status 3 "Married" 4 "Never married" 1 "Divorced / separated" 5 "Widow / widower" 2 "Living with a partner"
		label define contraceptives 2 "Yes" 3 "No"
		label define malecontraslabel 34 "Yes" 78 "No"
		label define school_label 99 "Secondary/'A' 5Level" 29 "College (Middle Level)" 39 "Primary" 49 "University" 19 "Post-Primary/Vocational" 
		label define methods_label 45 "IUD" 90 "female_condoms rhythm" 12 "injectables" 22 "implants" 33 "male_condoms" 87 "LAM" 55 "pill" 47 "withdrawal rhythm" 22 "female_sterilization" 33 " implants pill" 17 "beads"
		
		

	//	label values
	
	// Label marital status, assigning the value label to the data of the specific label
	
		encode F_Marital_Status, gen(newF_Marital_Status) lab(marital_status)
		order newF_Marital_Status, after(F_Marital_Status)
		drop F_Marital_Status
		rename newF_Marital_Status F_Marital_Status
		tabulate F_Marital_Status
		tabulate F_Marital_Status, nol


	// Labelling contraceptives
	
		encode Contraceptive, gen(new_contraceptives) lab(contraceptives)
		order new_contraceptives, after(Contraceptive)
		drop Contraceptive
		rename new_contraceptives Contraceptive
		
		tab Contraceptive , mi           // list contraceptive
		tab Contraceptive , mi nol
		
		
	// Labelling male contraceptives
	
		encode male_cp, gen(new_male_cp) lab(malecontraslabel)
		order new_male_cp, after(male_cp)
		drop male_cp
		rename new_male_cp male_cp
		tabulate male_cp, nol
		
		
	 // label for the schools
	 
		encode school, gen(new_school) lab(school_label)
		order new_school, after(school)
		drop school
		rename new_school school
		tabulate school
		
	 // Labels for methods
	 
		
		encode current_method, gen(new_current_method) lab(methods_label)
		order new_current_method, after(current_method)
		
		* continue from here

	
	






	// Transform mcp and cp to a categorical format


	//	Generate dichotomous "in-union" variable to represent all women married or currently living with a man


	//	Generate age categories from FQ_age



	// 	Save the clean dataset 


	//	Step 6: Basic Analysis and interpratation


	//	Run basic frequencies


	////////////////// THE END //////////////////	

