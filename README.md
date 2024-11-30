
# PokeTiers

## Welcome
Welcome to PokeTiers, a school project developed in November 2024.

⚠️ Disclaimer: This is an educational project and is not affiliated with or endorsed by The Pokémon Company, Game Freak, or any related entities. All Pokémon-related assets and references belong to their respective owners.

## Project Overview
This project showcases a ranking of Pokémon from the OverUsed (OU) tier in the 9th generation competitive metagame. It also includes a collection of five sample teams for players to test and explore the 9G OU environment.  

## Technologies Used  

- **HTML/CSS**: For the website's structure and design.  
- **JavaScript**: For theme switching and clipboard functionality.  
- **PostgreSQL**: For database management.  
- **DBeaver**: Used for database design and querying.

## Objectives of the Project  

This website was created to:  
- Learn **HTML** and **CSS** on my own, with guidance from teachers.  
- Develop a **personal website** on a topic of our choice.  
- Respect specific requirements set by a project brief, including:  
  - Navigation menus.  
  - Hyperlinks to external and internal pages.  
  - Tables with headers, images, and merged cells.  
  - Forms with various input types.  
  - Style switching using CSS.  

### My Personal Contributions  

To go beyond the project’s basic objectives, I incorporated additional features using other technologies:  
- **JavaScript**: For dynamic elements such as theme switching and clipboard functionality.  
- **Database Integration**: Connected the website to a PostgreSQL database using PHP to store and manage data for Pokémon and teams.  
- **Hosting**: Deployed the site on **[AlwaysData](https://www.alwaysdata.com/)**, configuring environment variables for secure database connections.  

These additions allowed me to explore more advanced web development concepts and provide a robust solution for managing Pokémon-related data.

## Features  

- **Tier List**: A ranking of Pokémon in the OU tier, with details like roles, types, and images presented in a visually structured table.  
- **Sample Teams**: Five teams ready for battle, aimed at introducing players to different playstyles and strategies in OU.  
- **Educational Content**: Short sections explaining competitive concepts such as Pokémon tiers, team roles, and generations.  
- **Theme Switching**: Users can toggle between different visual themes using JavaScript.  
- **Clipboard Functionality**: Easily copy team scripts for use in simulators like Pokémon Showdown.  
- **PostgreSQL Integration**: A database to manage Pokémon and team data, ensuring scalability and efficient organization.  

## Database Overview  

The project includes SQL scripts to provide insight into the database structure and contents:  
- **`scripts_SQL/brouillon_*`**: Draft files that document the design process (some queries are missing as they were executed directly in DBeaver).  
- **`scripts_SQL/export_*`**: Exports of the finalized tables and data as configured in DBeaver.  
  
## Hosting  

The website is hosted on [AlwaysData](https://www.alwaysdata.com/), a hosting platform that provides flexible solutions for web projects. Variables such as database connection details are initialized directly on the AlwaysData platform using its environment variables feature, ensuring secure and efficient configuration.  

## How to Use  

1. Clone the repository using `git clone` or Download ZIP
2. Set up the database using the SQL scripts provided in the `scripts_SQL` folder. 
3. Open the HTML files in a browser to view the tier list and sample teams, or access the deployed version directly at Your AlwaysData URL.
