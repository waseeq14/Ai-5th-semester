
    % Declare dynamic facts
    dynamic(food/7).      % food(Name, Calories, Protein, Carbs, Fats, Vitamins, Restrictions)
    dynamic(condition/1).  % condition(Condition)
    dynamic(meal/3).      % meal(Type, Time, FoodList)

    % Define food items
    % (name,calories,proteins,carbohydrates,fats,vitamins,allergies)
    food(noodles, 350, 10, 50, 5, [vitamin_b, iron], []).
    food(chicken_breast, 165, 31, 0, 3.6, [protein, vitamin_b12], [allergy_poultry]).
    food(broccoli, 55, 3.7, 11, 0.6, [vitamin_c, vitamin_k], []).
    food(yogurt, 150, 15, 7, 8, [calcium, protein], [lactose_intolerance]).
    food(salmon, 206, 22, 0, 13, [omega_3, vitamin_d], []).
    food(beans, 130, 7, 23, 0.6, [fiber, protein], []).
    food(spinach, 23, 2.9, 3.6, 0.4, [vitamin_a, iron], []).
    food(almonds, 576, 21, 22, 49, [vitamin_e, magnesium], []).
    food(quinoa, 120, 4, 21, 2, [fiber, protein], []).
    food(orange, 62, 1.2, 15, 0.2, [vitamin_c, potassium], []).
    food(egg, 68, 5.5, 0.6, 4.8, [protein, vitamin_b12], []).
    food(sweet_potato, 112, 2, 26, 0.2, [vitamin_a, fiber], []).
    food(greek_yogurt, 100, 10, 3.6, 6, [calcium, protein], [lactose_intolerance]).
    food(avocado, 160, 2, 15, 15, [healthy_fats, vitamin_k], []).
    food(whole_grain_bread, 80, 3, 15, 1, [fiber, protein], []).
    food(chickpeas, 164, 8.9, 27, 2.6, [fiber, protein], []).
    food(carrot, 41, 0.9, 10, 0.2, [vitamin_a, potassium], []).
    food(tuna, 144, 30, 0, 3.3, [protein, omega_3], []).
    food(milk, 103, 5, 12, 2.4, [calcium, protein], [lactose_intolerance]).
    food(banana, 105, 1.3, 27, 0.3, [vitamin_c, potassium], []).
    food(brown_rice, 215, 5, 45, 1.6, [fiber, protein], []).
    food(cottage_cheese, 206, 28, 3.4, 8.5, [protein, calcium], [lactose_intolerance]).
    food(pasta, 300, 10, 50, 2, [vitamin_b, iron], []).
    food(beef_steak, 250, 26, 0, 17, [protein, vitamin_b12], [allergy_beef]).
    food(asparagus, 20, 2.2, 3.7, 0.2, [vitamin_c, vitamin_k], []).
    food(kiwi, 61, 1.1, 15, 0.5, [vitamin_c, potassium], []).
    food(peanut_butter, 188, 8, 6, 16, [protein, healthy_fats], [allergy_peanut]).
    food(lettuce, 5, 0.5, 1, 0.1, [vitamin_a, vitamin_k], []).
    food(blueberries, 84, 0.5, 21, 0.5, [vitamin_c, fiber], []).
    food(sardines, 208, 24, 0, 11, [omega_3, vitamin_d], []).
    food(potatoes, 77, 2, 17, 0.1, [vitamin_c, potassium], []).
    food(cucumber, 16, 0.7, 3, 0.2, [vitamin_k, potassium], []).
    food(olive_oil, 119, 0, 0, 13.5, [vitamin_e], []).
    food(bell_pepper, 31, 1.3, 6, 0.3, [vitamin_c, vitamin_a], []).
    food(onion, 40, 1.1, 9, 0.1, [vitamin_c, vitamin_b6], []).
    food(white_rice, 130, 2.7, 28, 0.3, [], []).
    food(watermelon, 30, 0.6, 8, 0.2, [vitamin_c, vitamin_a], []).
    food(oatmeal, 150, 5, 30, 2, [fiber, protein], []).
    food(chia_seeds, 138, 4, 12, 9, [omega_3, fiber], []).
    food(berry_smoothie, 200, 5, 40, 3, [vitamin_c, fiber], []).
    food(chicken_salad, 300, 25, 10, 15, [vitamin_a, vitamin_c], []).
    food(grilled_salmon, 250, 30, 0, 15, [omega_3, vitamin_d], []).
    food(vegetable_stir_fry, 200, 5, 15, 12, [vitamin_a, vitamin_c], []).
    food(baked_chicken, 280, 30, 5, 15, [vitamin_b12, iron], []).
    food(whole_grain_pasta, 180, 8, 35, 2, [fiber, protein], []).
    food(vegetarian_burrito_bowl, 350, 15, 45, 12, [fiber, protein], []).
    food(greek_salad, 250, 10, 15, 20, [vitamin_a, vitamin_c], []).
    food(vegetable_quinoa_bowl, 300, 12, 30, 15, [fiber, protein], []).
    food(smoked_salmon_bagel, 350, 20, 30, 15, [omega_3, vitamin_d], []).
    food(chickpea_wrap, 280, 12, 40, 8, [fiber, protein], []).
    food(spinach_omelette, 200, 15, 5, 12, [vitamin_a, vitamin_c], []).
    food(whole_wheat_wrap, 120, 4, 20, 3, [fiber, protein], []).
    food(quinoa_salad, 220, 8, 30, 10, [fiber, protein], []).
    food(baked_sweet_potato, 150, 2, 35, 0.5, [vitamin_a, fiber], []).



    % UserUser input and information gathering
    start :-
        write('Welcome! To generate your personalized diet plan, I need some information:'),
        nl,
        get_user_info(UserInfo),
        getHealthC(CList),
        getLikedFoods(LList),
        getDislikedFoods(DList),
        process_info(UserInfo, CList, LList,DList).

    read_integer(N) :-
    read_line_to_string(user_input, Input),
    atom_number(Input, N).

    % Get user information (age, gender, weight, height, activity level)
    get_user_info(UserInfo) :-
        get_age(Age),
        get_gender(Gender),
        get_weight(Weight),
        get_height(Height),
        get_activity_level(Activity),
        UserInfo = [age(Age), gender(Gender), weight(Weight), height(Height), activity(Activity)].

    get_age(Age) :-
        write('Enter your age: '),
        read_integer(Age).

    % Get gender
    get_gender(Gender) :-
        write('Enter your gender (1 for male, 2 for female): '),
        read_integer(Gender).

    % Get weight
    get_weight(Weight) :-
        write('Enter your weight in kilograms: '),
        read_integer(Weight).

    % Get height
    get_height(Height) :-
        write('Enter your height in centimeters: '),
        read_integer(Height).

    % Get activity level
    get_activity_level(Activity) :-
        write('Enter your activity level (1 for low, 2 for medium, 3 for high): '),
        read_integer(Activity).


    getHealthC(CList) :-
    writeln("Enter Health Conditions (or type 'stop' to finish): "),
    read(Condition),
    (Condition == stop -> CList = [] ; [Condition|Rest] = CList, getHealthC(Rest)).

    getLikedFoods(LList) :-
        writeln("Enter foods you like (or type 'stop' to finish): "),
        read(Food),
        (Food == stop -> LList = [] ; [Food|Rest] = LList, getLikedFoods(Rest)).

    getDislikedFoods(DList) :-
        writeln("Enter foods you are allergic to or you dislike (or type 'stop' to finish): "),
        read(Food),
        (Food == stop -> DList = [] ; [Food|Rest] = DList, getDislikedFoods(Rest)).


    % Process user information and generate recommendations
    process_info(UserInfo, CList, LList, DList) :-
        calculate_needs(UserInfo, Needs),
        generate_meal_plan(Needs, CList, LList,DList, MealPlan),
        write('Here is your personalized meal plan:'),
        nl,
        display_meal_plan(MealPlan),
        writeln("Waseeq Ur Rehman - FA21 BCT 021"),
        writeln("Syeda Farwa Ali - FA21 BCT 016").

    % Calculate calorie and nutrient needs based on user information
    calculate_needs(UserInfo, Needs) :-
        extract_age(UserInfo, Age),
        extract_gender(UserInfo, Gender),
        extract_weight(UserInfo, Weight),
        extract_height(UserInfo, Height),
        extract_activity(UserInfo, Activity),
        calculate_bmr(Age, Gender, Weight, Height, BMR),
        calculate_daily_calories(Activity, BMR, DailyCalories),
        calculate_macronutrients(DailyCalories, Needs).

    extract_age([age(Age), _, _, _, _], Age).
    extract_gender([_, gender(Gender), _, _, _], Gender).
    extract_weight([_,_,weight(Weight),_,_], Weight).
    extract_height([_,_,_,height(Height),_],Height).
    extract_activity([_,_,_,_,activity(Activity)],Activity).

    calculate_bmr(Age, Gender, Weight, Height, BMR) :-
        Gender = 1,
        BMR is 88.362 + (13.397 * Weight) + (4.799 * Height) - (5.677 * Age);
        Gender = 2,
        BMR is 447.593 + (9.247 * Weight) + (3.098 * Height) - (4.330 * Age).

    calculate_daily_calories(Activity, BMR, DailyCalories) :-
        (   Activity = 1 ->  % If Activity is 1 (low)
            DailyCalories is BMR * 1.2;
            Activity = 2 ->  % If Activity is 2 (medium)
            DailyCalories is BMR * 1.55;
            Activity = 3 ->  % If Activity is 3 (high)
            DailyCalories is BMR * 1.725;
            otherwise ->     % If Activity doesnt match any of the above
            throw(invalid_activity_level)  % Throw an exception
        ).

    calculate_macronutrients(DailyCalories, Needs) :-
        % Adjust these percentages as needed based on goals
        ProteinRatio is 0.3,
        CarbRatio is 0.45,
        FatRatio is 0.25,
        Protein is DailyCalories * ProteinRatio,
        Carbs is DailyCalories * CarbRatio,
        Fat is DailyCalories * FatRatio,
        Needs = [daily_calories(DailyCalories), protein(Protein), carbs(Carbs), fat(Fat)].


    % Generate meal plan considering needs, health conditions, and preferences
    generate_meal_plan(Needs, CList, LList,DList, MealPlan) :-

        generate_meal(breakfast, Needs, CList,LList,DList, Breakfast),
        assertz(meal(breakfast, Breakfast)),

        generate_meal(lunch, Needs, CList,LList,DList, Lunch),
        assertz(meal(lunch, Lunch)),

        generate_meal(dinner, Needs, CList,LList,DList, Dinner),
        assertz(meal(dinner, Dinner)),
    % MealPlan = [meal(breakfast, Breakfast)].


    MealPlan = [meal(breakfast, Breakfast), meal(lunch, Lunch), meal(dinner, Dinner)].


    generate_meal(MealType, Needs, CList, LList, DList, MealList) :-
        findall(Food, (
            food(Food, _, _, _, _, _, _),
            not(member(Food, DList)),
            (member(like(Food), LList) ; true),
            check_health_conditions(Food, CList),
            check_meal_type_suitability(Food, MealType)
        ), TempList),

        get_meal_nutrient_targets(Needs, MealNeeds),

        % Use predefined lists based on different conditions
        select_meal_list(MealNeeds, MealType, PredefinedList),

        % Intersect TempList and PredefinedList to get the final MealList
        intersection(TempList, PredefinedList, MealList).

    meal_list(high_protein, [chicken_breast,oatmeal, salmon, beans,banana,avocado,brown_rice, greek_yogurt, tuna, egg, beef_steak]).
    meal_list(high_carbs, [quinoa, sweet_potato, brown_rice, pasta, chickpeas, whole_grain_bread, oats,smoked_salmon_bagel]).
    meal_list(high_fat, [avocado, almonds, olive_oil, salmon, egg, peanut_butter,beef_steak,spinach_omelette]).

    % Select the appropriate predefined list based on MealNeeds
    select_meal_list(MealNeeds, MealType, PredefinedList) :-
        member(MealType, [breakfast, lunch, dinner]),  % Ensure MealType is valid
    (          select_meal_list_by_nutrient(MealNeeds, high_protein, PredefinedList)
        ;   select_meal_list_by_nutrient(MealNeeds, high_carbs, PredefinedList)
        ;   select_meal_list_by_nutrient(MealNeeds, high_fat, PredefinedList)
        ;   default_meal_list(MealType, PredefinedList)  % Default to a standard list if no specific condition is met
        ).

    % Select predefined meal list based on specific nutrient condition
    select_meal_list_by_nutrient(MealNeeds, NutrientCondition, PredefinedList) :-
        member(NutrientCondition, [high_calories, high_protein, high_carbs, high_fat]),
        MealNeeds = [calories(Calories),proteins(Proteins),carbs(Carbs),fats(Fats)],
        (
        NutrientCondition = high_protein,Proteins > 250
        ;   NutrientCondition = high_carbs,Carbs > 380
        ;   NutrientCondition = high_fat,Fats > 160
        ),
        meal_list(NutrientCondition, PredefinedList).

    % Default meal list for each meal type
    default_meal_list(breakfast, [oatmeal, chia_seeds, berry_smoothie, yogurt, greek_yogurt, almonds, egg, orange, banana, kiwi, whole_grain_bread, potatoes, cucumber, olive_oil, watermelon]).
    default_meal_list(lunch, [chicken_breast, broccoli, salmon, beans, quinoa, sweet_potato, tuna, brown_rice, chickpeas, asparagus, lettuce, bell_pepper, white_rice, chicken_salad, grilled_salmon, vegetable_stir_fry, baked_chicken, whole_grain_pasta, vegetarian_burrito_bowl, greek_salad, vegetable_quinoa_bowl, smoked_salmon_bagel, chickpea_wrap, spinach_omelette, whole_wheat_wrap, quinoa_salad]).
    default_meal_list(dinner, [spinach, almonds, avocado, chickpeas, whole_grain_bread, beef_steak, sardines, pasta, potatoes, cucumber, olive_oil, onion, white_rice]).


    check_meal_type_suitability(Food, breakfast) :-
        member(Food, [oatmeal, chia_seeds, berry_smoothie, yogurt, greek_yogurt, almonds, egg, orange, banana, kiwi, whole_grain_bread, potatoes, cucumber, olive_oil, watermelon]).

    check_meal_type_suitability(Food, lunch) :-
        member(Food, [chicken_breast, broccoli, salmon, beans, quinoa, sweet_potato, tuna, brown_rice, chickpeas, asparagus, lettuce, bell_pepper, white_rice, chicken_salad, grilled_salmon, vegetable_stir_fry, baked_chicken, whole_grain_pasta, vegetarian_burrito_bowl, greek_salad, vegetable_quinoa_bowl, smoked_salmon_bagel, chickpea_wrap, spinach_omelette, whole_wheat_wrap, quinoa_salad]).

    check_meal_type_suitability(Food, dinner) :-
        member(Food, [spinach, almonds, avocado, chickpeas, whole_grain_bread, beef_steak, sardines, pasta, potatoes, cucumber, olive_oil, onion, white_rice]).


    get_meal_nutrient_targets(Needs, MealNeeds) :-
        Needs = [daily_calories(DailyCalories), protein(MinProtein), carbs(MinCarbs), fat(MinFat)],
        NumMeals = 3,  % Assuming 3 meals per day, adjust as needed
        Calories is DailyCalories / NumMeals,
        Proteins is MinProtein / NumMeals,
        Carbs is MinCarbs / NumMeals,
        Fats is MinFat / NumMeals,
        MealNeeds = [calories(Calories), proteins(Proteins), carbs(Carbs), fats(Fats)].

    % Check if the food satisfies the users health conditions
    check_health_conditions(Food, CList) :-
        (   CList = []   % If CList is empty, automatically succeed
        ;   \+ forall(member(Condition, CList), has_condition(Food, Condition)) % Otherwise, apply the original logic
        ).

    % Check if the food has a specific health condition
    has_condition(Food, Condition) :-
        food(Food, _, _, _, _, _, Conditions),
        member(Condition, Conditions).


    display_meal_plan(MealPlan) :-
        forall(member(meal(MealType, FoodList), MealPlan),
            (write('*** '), write(MealType), write(' ***'), nl,
                write_food_list(FoodList), nl,
                display_food_details(FoodList))).

    display_food_details([]).
    display_food_details([Food|Rest]) :-
        food(Food, Calories, Proteins, Carbs, Fats, Vitamins, _),
        write('- '), write(Food), nl,
        write('  Calories: '), write(Calories), nl,
        write('  Proteins: '), write(Proteins), nl,
        write('  Carbs: '), write(Carbs), nl,
        write('  Fats: '), write(Fats), nl,
        write('  Vitamins: '), write(Vitamins), nl,
        nl,
        display_food_details(Rest).

    write_food_list([]).
    write_food_list([Food|Rest]) :-
        write('- '), write(Food), nl,
        write_food_list(Rest).
