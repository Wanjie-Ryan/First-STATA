

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
		rename mcp Modern_CP
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

		list Enum_Area F_Age school F_Marital_Status Contraceptive Modern_CP current_method Age_at_first_use have_Insurance used_Insurance age_at_first_sex if _n >= 1 & _n <11

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
		label variable Contraceptive "Women who are currently using a contraceptive method"
		label variable Modern_CP "Women currently using a modern method of family planning"
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
		label define have_Insurance_label 33 "No" 44 "Yes"
		label define used_Insurance_label 33 "No" 44 "Yes" 
		label define Enum_Area_label 12 "EMALI_CENTRAL" 34 "ISHAMBA_KWA_MUSEU_GLORIOUS" 55 "KALULINI_KASEVE" 9 "KANUNDU" 8 "KAVILA_IUNI" 67 "KAVUKUNI" 47 "KIKIMA_A" 66 "KIU_SAFARI_B" 21 "KIVUUTINI_NZOUNI_KAMBILI" 53 "KWAMBULA" 49 "KWA_SISAL" 13 "KYAKATHUNGU_UKETA" 59 "KYANDUE" 77 " KYUUNI" 71 "MATONDONI"  73 "MAULUNI_MAANGI_UVUNGU_MUANGENI_KALULUINI" 98 "MIKAMENI_KATHIANI " 88 "MUUSINI_MUKAME" ///
		101 "NGAMYONE_KATULUKI_TAITI" 102 "NTHONGONI" 105 "NZOILA" 110 "SHIMO" 111 "TAWA"  115 "TOWNSHIP_B" 199 "UNOA_RURAL" 221 "YIMWAMBA_MUTHINGITHO"



		label define Agelab 15 "15-17 Yrs" 18 "18-24 Yrs" 24 "25+ Yrs"

		label define Age_at_first_use_labels -99 "Not Mention" 10 "11-14 Yrs" 15 "15-19 Yrs" 20 "20-24 Yrs" 25 "25-29 Yrs" 30 "30-34 Yrs" 35 "35-39 Yrs" 40 "40-44 Yrs"



		// 		-65 "-"

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

		encode Modern_CP, gen(new_Modern_CP) lab(malecontraslabel)
		order new_Modern_CP, after(Modern_CP)
		drop Modern_CP
		rename new_Modern_CP Modern_CP
		tabulate Modern_CP, nol


		// label for the schools

		encode school, gen(new_school) lab(school_label)
		order new_school, after(school)
		drop school
		rename new_school school
		tabulate school

		// Labels for methods


		encode current_method, gen(new_current_method) lab(methods_label)
		order new_current_method, after(current_method)
		drop current_method
		rename new_current_method current_method
		tab current_method, mi  


		// Label for having an insurance


		encode have_Insurance, gen(new_have_Insurance) lab(have_Insurance_label) 
		order new_have_Insurance, after(have_Insurance)
		drop have_Insurance
		rename new_have_Insurance have_Insurance
		tab have_Insurance, mi nol


		// Label for used insurance


		encode used_Insurance, gen(new_used_Insurance) lab(used_Insurance_label)
		order new_used_Insurance, after(used_Insurance)
		drop used_Insurance
		rename new_used_Insurance used_Insurance
		tab used_Insurance, mi nol


		// Label for enumaration area

		encode Enum_Area, gen(new_Enum_Area) lab(Enum_Area_label)
		order new_Enum_Area, after(Enum_Area)
		drop Enum_Area
		rename new_Enum_Area Enum_Area
		tab Enum_Area, nol





		// Transform FQ_age and age at first sex to a categorical format
		gen age_group_3=0
		replace age_group_3 =15 if F_Age >14 & F_Age <18
		replace age_group_3 =18 if F_Age >17 & F_Age <25
		replace age_group_3 =24 if F_Age >24 & F_Age <.
		assert age_group_3 ==. if F_Age ==.
		tab F_Age age_group_3 
		tab age_group_3

		//	assign labels 
		label values age_group_3 Agelab
		// 		33

		// OR

		capture drop  age_group_3v2
		egen age_group_3v2 =cut(F_Age), at(15(5)50)
		tab F_Age age_group_3v2




		// GROUPING AGE AT FIRST SEX
		label define sexualdebutlab -99 "No response" -88 "Do not Know" 0 "never had sex" 10 "10 - 14 Yrs" 15 " 15 - 19 Yrs" 20 " 20 - 24 Yrs" 25 " 25 - 29 Yrs" 

		summ age_at_first_sex, detail
		capture drop  sexual_debut
		egen sexual_debut =cut(age_at_first_sex), at(10(5)30)
		replace sexual_debut = 0 if age_at_first_sex ==-77
		replace sexual_debut = -99 if age_at_first_sex ==-99
		replace sexual_debut = -88 if age_at_first_sex ==-88

		* Assign labels
		label values sexual_debut sexualdebutlab

		*	Interplate sexual debut
		tabulate sexual_debut  // Majority of the women in Kenya had their first sex between the age of 15 - 19 Years.


		// GROUPING AGE AT FIRST USE OF CONTRACEPTIVES


		tab F_Age age_group_3v2

		sum Age_at_first_use

		gen Age_at_first_use_v1 = 0
		replace Age_at_first_use_v1 = -99 if Age_at_first_use < 0
		replace Age_at_first_use_v1 = 10 if Age_at_first_use > 10 & Age_at_first_use < 15
		replace Age_at_first_use_v1 = 15 if Age_at_first_use >= 15 & Age_at_first_use < 20
		replace Age_at_first_use_v1 = 20 if Age_at_first_use >= 20 & Age_at_first_use < 25
		replace Age_at_first_use_v1 = 25 if Age_at_first_use >=25 & Age_at_first_use < 30
		replace Age_at_first_use_v1 = 30 if Age_at_first_use >=30 & Age_at_first_use < 35
		replace Age_at_first_use_v1 = 35 if Age_at_first_use >=35 & Age_at_first_use < 40
		replace Age_at_first_use_v1 = 40 if Age_at_first_use >= 40 & Age_at_first_use < 45

		// 		assert Age_at_first_use_v1 ==. if Age_at_first_use ==.


		tab Age_at_first_use_v1
		tab Age_at_first_use Age_at_first_use_v1

		label values Age_at_first_use_v1 Age_at_first_use_labels

		tab Age_at_first_use Age_at_first_use_v1


		//	Generate dichotomous "in-union" variable to represent all women married or currently living with a man
		label define maritalstatuslab 1 "Married" 0 "Not Married"

// 		gen inunion_A =(F_Marital_Status ==3 | F_Marital_Status ==2)

// 		srhsf

		capture drop in_union
		gen in_union = 0
		replace in_union = 1 if F_Marital_Status == 3 | F_Marital_Status == 2
		label values in_union maritalstatuslab

		tabulate in_union, m
		tabulate F_Marital_Status in_union, m




		//	Step 6: Basic Analysis and interpratation 
		
		
		* Step 6.1 - What is the proportion of married women that are currently using a modern contraceptive method?

				tab in_union
			    tab in_union Modern_CP
				tab in_union Modern_CP, row
				tab in_union Modern_CP, column
				
				
				// 52 out of 73 married use modern contraceptives, or 71.23% of married people
	
	
		* Step 6.2 - What is the median age for the participants in this sample?
		
				tab F_Age
				
				sum F_Age
				
				sum F_Age,detail
				
				// 31 is the median age 
				
// 				sum F_Age centile(50)


		* Step 6.3 - What is the relationship of schooling on modern contraceptive use among married women?
		
			tab Modern_CP
			tab1 school Modern_CP in_union  


		* Step 6.4 - What is the proportion of All women that are currently using a modern contraceptive method?


		* Step 6.5 - What is the dominant method of contraception among the women presented in this dataset?


		// 	Save the clean dataset 

		save "E:\Programming\Stata\ICRHK-Practice data", replace	





		////////////////// THE END //////////////////	

