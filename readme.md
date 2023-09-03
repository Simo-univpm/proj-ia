# Artificial intelligence project aa 22/23.

Development of a pc components recommender system

## Group members
- Francalancia Simone, id s1102917

## Project description
This PC components recommender system is a Prolog-based system that helps users find recommendations for computer components such as CPUs (central processing units), GPUs (graphics processing units), and RAM (random-access memory) modules. It operates based on user search history and user ratings of components. Here is a brief description of its functionality:

    - Search History: Users have search histories that record the components they have searched for in the past. This history helps the system provide recommendations based on their preferences.

    - Component Facts: The system has facts about various computer components, including their categories (CPU, GPU, RAM), prices, and user ratings expressed by reviews.

    - Recommendation System Core: The core of the system provides the following functionality:
        Recommendations: Users can receive component recommendations based on their search history, specified price range, and category preferences (or allow the system to choose a category).
        Review Components: Users can review and rate components.
        Check Reviews: Users can view the reviews and ratings they have given to components.

    - Collaborative Filtering: The system uses collaborative filtering to find similar users based on their ratings and recommends components that similar users have searched for and rated positively.

    - Admin Menu: There is also an admin menu for managing the knowledge base. Admins can view all facts, insert new components, and delete existing components.

    - Initialization and Navigation: Users and admins can navigate through menus to access the system's features.

The system aims to provide personalized recommendations for computer components based on user preferences and reviews from similar users. Users can interact with the system to get suggestions for components that match their needs and preferences.

---

## Program execution
To launch the program you will need to:

```
- install prolog on your system (https://www.swi-prolog.org/);
- download this source code and open a new terminal in the file position;
- write "swipl" in the terminal to launch swi-prolog;
- write "[recommend]." to load the recommender system software;
- write "init." to launch the recommender system software main entry point.
```
