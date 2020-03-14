# CS 1XA3 Project02 - KASHIS2
## Overview
This webpage is Sarib Kashif's custom CV. It is created in a slideshow style --- scrolling downwards --- to provide plenty of information but not in an overwhelming manner. Each section is kept short and to the point to ensure that visitors do not lose interest. Color theme is black and white to keep it formal and simple.
## Custom Javascript Code
##### Feature 1: Overlayed Description
- Description: When user selects a project under the **Projects** section, an overlay appears with a description of the project.
- Execution: 
    - DOM is used to get the ID of the overlay and then the width is changed to cover the full screen. 
    - The JQuery function *slideUp()* is used to hide the navigation bar at the top of the screen when the user selects to close the navigation bar. 
    - JQuery is also used to show the description once the overlay has fully loaded, after 0.5 seconds, and then hide it when it's closed.
##### Feature 2: Toggle Dark Mode
- Description: When user selects the `Dark Mode` button, the theme of the website becomes dark. It can be changed back by pressing the button again.
- Execution: 
    - Class called **dark-mode** is created. It sets the background color to black, and the text color to white. 
    - Using DOM, when user clicks `Dark Mode`, I toggle between adding and removing the class **dark-mode**. 
    - Some of the text and background did not change because they had preset colors, so I set a class name for those elements and using a for loop, toggled each color manually with DOM manipulation.
##### Feature 3: Transition to Volunteer/Certifications
- Description: Under the Resume section, if user selects the `Next` button, Work/Education gets overlapped by a new section containing Volunteer/Certifications. 
- Execution: 
    - When the button is pressed, the elements containing work/education slide down, while volunteer/certifications slide up. 
    - This is done using slideToggle(). If button is pressed again, the initial elements come back.
##### Feature 4: Show Skill Description
- Description: When a skill is selected, a description is provided of how I obtained the skill.
- Execution: Using the **.click** function with JQuery, when the button is clicked, the hidden description is displayed --- with **slideToggle()** --- and then hidden when the skill is pressed again.
##### Feature 5: Change Text on Button with JQuery
- Description/Execution: When user clicks the `Dark Mode` button or `Next` button in the resume section, the button fades out, and then fades back in with the text changed to something else using JQuery.
##### Feature 6: View Resume
- Description/Execution: When the `Download Resume` button is clicked at the end of the webpage, a function in JavaScript, called openResume() is called to download the Resume file.
## References
- Inspiration was taken from the following YouTube video for the HTML and CSS documents: https://www.youtube.com/watch?v=qCFN8EujbGI
- The navigation bar on top, used to go to different parts of the site was modified from https://getbootstrap.com/docs/4.0/components/navbar/
- Part of the code from the following repository was used to go to different parts of the website: https://github.com/cferdinandi/smooth-scroll
- The social media icons were taken from https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css
- Inspiration for text change on click was taken from https://stackoverflow.com/questions/19365386/jquery-change-button-text-on-click/38913869
