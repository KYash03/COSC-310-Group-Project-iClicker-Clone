# Final Report

This is the final video presentation for our project. 

[Video Link](https://youtu.be/xxgTXwRAvXU)

## General Development

1. Our team built a web-based classroom polling and feedback platform, allowing instructors to pose questions and receive instant student feedback. The product is not feature complete, but it is able to run and perform the basic functions.
2. We successfully delivered the majority of the features we initially planned for. Although we were unable to implement the functionality for instructors to post the correct answer and for students to view it,the ability for users to update their account settings, and ability for students to answer the question, we managed to meet most of our initial requirements; as a result, we were able to implement a comprehensive iClicker system with the essential features and functionalities.
   | No. | Description | Requirement Met |
   | --- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------- |
   | 1.1 | Instructor must be able to start the session. | Yes |
   | 1.2 | Instructors must be able to post multiple-choice questions to students using the platform. | Yes |
   | 1.3 | Students would be able to join the class as one big session. | Yes |
   | 1.4 | The app will be regularly updated, and improvements must be made according to the feedback provided. | Yes |
   | 1.5 | Students must be able to respond to questions and submit their answers through the platform. | Yes |
   | 1.6 | The instructor and student must be able to see what the student has answered. | Yes |
   | 1.7 | The instructor must be able to start the poll and end the poll according to his convenience. | Yes |
   | 1.8 | Instructor or student must be able to login or create a new account. | Yes |
   | 1.9 | The instructor must be able to post the right answer and the student must be able to see what the right answer is. | No |
   | 2.1 | The platform must allow the students and the instructors to create and delete accounts. | Yes |
   | 2.2 | The platform must allow the users to update account information such as name, email id. | No |
   | 2.3 | The platform must allow the instructor to create and delete a course. | Yes |
   | 2.4 | The platform must allow the student to join and leave a course. | Yes |
   | 2.5 | The platform must allow instructors to create a poll displayed to students. | Yes |
   | 2.6 | The platform must allow students to select and submit their responses to polls. | Yes |
   | 2.7 | The platform must show the results of the poll to the instructor in real time. | Yes |
   | 2.8 | The platform must store data of students, instructors, and polls in a database, which can be retrieved by the application. | Yes |
   | 2.9 | The platform must allow the instructor to create a session (for each lecture/speech) in which multiple polls can be created, and at the end, the session can be terminated. | Yes |
   | 3.1 | The application will be based on continuous integration (CI) and continuous development (CD). | Yes |
   | 3.2 | The poll should be shown to the students in less than 5 seconds upon the creation of a poll by the instructor. | Yes |
   | 3.3 | If a poll is updated or deleted by an instructor, the changes must be updated in the database and visible to the students in less than 5 seconds. | Yes |
   | 3.4 | If a student changes their answer, it should be updated in the database within 2 seconds. | Yes |
   | 3.5 | The application will be compatible with various kinds of operating systems, and devices with older software versions as well. | Yes |
   | 3.6 | The application could also be used by various people with special needs. The accessibility will be increased by adding features like font adjustment, voice reading of the text, and more. | Yes |

   The requirements were fine for the most part; however, while working on the project, we realized we could have benefited from further detail in the requirements we created to help us better understand the scope and complexity of the project.

3. The architecture of the system can be described as a three-tier architecture, which consists of the following layers:

   - **Presentation Layer (Front-end):** This layer is responsible for displaying the user interface and presenting data to users. It consists of HTML, CSS, and JavaScript for structuring, styling, and adding interactivity to the website. JSP (JavaServer Pages) is used to dynamically generate HTML content by embedding Java code within the HTML, allowing for server-side processing and the creation of dynamic web pages.

   - **Application Logic Layer (Middle-tier):** This layer contains the business logic of the application, which processes user input, manages data, and performs various operations. Java Servlets are used to handle HTTP requests, process data, and generate responses using JSP templates. This layer is responsible for implementing the core functionality of the system and coordinating interactions between the front-end and back-end.

   - **Data Access Layer (Back-end):** This layer is responsible for managing data storage and retrieval. SQL Server, a relational database management system, is used to store and manage data. Java can be used to interact with the SQL Server through JDBC (Java Database Connectivity) to perform database operations such as creating, reading, updating, and deleting records.

The key components of the system include:
   - Login/Signup: This component allows users (student and instructors) to create accounts and authenticate themselves before accessing the system.

   - Dashboard: The dashboard provides users with an overview of the main features and functionalities, such as course information, recent polls, and performance metrics. It may have different views for instructors and students.

   - Course Management: This component allows instructors to create, modify, and delete courses.

   - Poll Management: Instructors can create, modify, and delete polls, as well as control the start and end times of each poll. Students can view and respond to active polls.

   - Real-time Feedback: This component displays real-time poll results to instructors and, optionally, to students once the poll has ended. This may include visualizations like charts or graphs.

   - User Profile Management: This component enables users to update their personal information, such as name, email address, and password.

   - Reporting and Analytics: This component may provide instructors with insights into student performance, engagement, and understanding of course material based on poll results and other data.

We did not implement any noticible design patterns; however, at the same time, we also made sure that we avoid anti-patterns.

Our team has made significant progress in developing the iClicker Clone application, with several features completed and a few still in progress. Completed features include user login and signup functionality for both students and instructors, with each user type having dedicated interfaces. Users are redirected to their respective dashboards upon successful login, where they can view their enrolled or created courses. We have successfully linked the login and signup pages to facilitate seamless navigation between them.
Instructors can create and delete courses and have the ability to start and end poll sessions. We have implemented and tested the functionality for adding and deleting courses, along with the necessary test cases. The user interface for displaying questions and options to students has been created, and we have designed separate student and instructor dashboards that display the relevant information.
However, there are still some tasks that need to be completed. We are currently implementing poll creation functionality and developing the associated test cases. The remaining tasks include creating test cases for polls, ensuring students can join sessions to respond to questions, displaying results in the form of real-time graphs, and allowing students to update their account information.
Once these pending tasks are completed, we will have a fully functional iClicker Clone application that meets the project requirements and provides an effective platform for classroom polling and feedback.

4. We had a moderate degree of re-usability of our code --- each page required a connection to the database. It was difficult to refactor our code to improve reasubility due to time constrants. However, we do admit reuasbility would have improved the rate of implementation of features.

5. The backlog for the iClicker Clone project comprises several tasks that are yet to be completed to achieve a fully functional application. These tasks include developing test cases for polls, ensuring that students can join sessions to respond to the instructor's questions, and displaying the results in the form of real-time graphs to provide immediate feedback for both students and instructors. Additionally, we need to implement functionality that allows students to update their account information, such as their credentials and other personal details. Our team is continuously working on addressing these items in the backlog to ensure that we deliver a comprehensive, user-friendly, and effective classroom polling and feedback solution that meets the project requirements and exceeds user expectations.

## CI/CD

1. To perform testing, we have utilized JUnit tests, which is a widely used Java testing framework. We created a separate DDL file to support our tests locally. We have written individual tests for nearly every function and method, and all of our tests are automated. This means that when we run one test, all the previously implemented tests run automatically as well, saving us time and effort. To implement these tests, we have used an Integrated Development Environment (IDE) called VS Code, which provides a convenient platform for writing and running our tests.Overall, by using JUnit tests and automating our testing process, we can ensure that our code is thoroughly tested and free of bugs or errors. Additionally, by using an IDE like VS Code, we can streamline the testing process and make it more efficient.
In the future, if given an opportunity we will use JEST tests, as we have heard that it is much more effecient and effective. 

2. Our branching workflow worked well overall, as we created several branches to work on different features and tasks concurrently, which improved development efficiency and allowed for better organization. For example, we had a feature of adding a course by the instructor. So we created a seperate branch known as addCourse. We first created a test case and pushed it. And then we implementend the functionality and pushed it. Then , we created a pull request. One of the other team mates reviwed the pull request and tested the code. After the tests were passed, only then did we merge the branch. 
Yes we were succesfull in following this workflow . All the team mates communicated well whenever a pull request was created.

3. We implemented the system using docker --- allowing to easily collaborate with developers with different systems. To deploy the docker, the ddl files are required, SQL connecter drivers and MySQL server and SQL server drivers are required. Lastly, the DockerFile would be required.

## Reflection

1. Initially, we all met to discuss how we would distribute the work. We used a kanban board to decide what we would accomplish in a particular milestone and who all will work on a specific task. We  used discord to communicate with each other. We initially struggled with time management, as we underestimated the tasks to be completed, leading to tight deadlines and increased pressure. We also had to contend with team members' differences in skills and experience. Over the course of the project, we learned to delegate tasks effectively based on each member's skill level, capitalizing on individual strengths.

The most challenging aspect was balancing time scheduling and learning new technologies since most of us needed to be more experienced. However, as we progressed, we better understood everyone's strengths and weaknesses and assigned tasks accordingly, improving overall efficiency.

For upcoming projects, We will keep on using github as it was a very useful tool for us. using github, we were able to work remotely and save our changes. We will also use kanban board as it was a great tool to keep track of what has been done and what is left. What we will change is that we will try to plan things a little bit ahead of time so that it gives us more time to improve our code. We plan to identify team members' strengths and weaknesses early in time, ensuring optimal task delegation. We'll also create a more detailed approach to working with new technologies, including allocating additional learning and experimentation time to avoid similar challenges.

2. Our initial requirements were sufficiently detailed but not up to the mark , which made it a little  difficult to grasp the full scope and complexity of the project. However, over the course of the project, we learned about the tools and intricacies involved in building the platform, which allowed us to refine and expand upon our initial requirements. We realized that we needed to look into some critical aspects, such as the functionality for instructors to post the correct answer and for students to view it, as well as the ability for users to update their account settings. Also we missed some other requiremnts such as  - user could login and signup, Intructor can delete a course , Students can drop out from a course. 

3. The main thing we missed in the initial planning phase was understanding everyone's familiarity with building full-stack systems and, more specifically, the programming skills each team member brought. Another critical thing that we missed was to understand how much time a feature can take up to be implemented. As a result, we faced pressure to meet some deadlines, which led to submitting insufficient or lower-quality code for a few milestones.

4. We utilized the Kanban process for task management. We created a kanban board on trello. To effectively manage the workflow, our team regularly discussed the progress and stages of our goals, updating the board accordingly. This approach fostered transparency and alignment among team members. As the project advanced, we observed continuous workflow efficiency and team communication improvement because of the collaborative and dynamic management process.

5. We used the same IDE (VSCode) across the team but faced issues with code formatting due to discrepancies in linter usage or configuration. Although it didn't affect functionality, it impacted readability. We also needed help setting up Docker, causing delays and complications in our development process. In the future, before starting the project, we will ensure that everyone has the necessary tools and configurations set up correctly.

6. Initially, we underestimated the effort required for the project, partly due to the team's relative inexperience with the necessary technology and unfamiliarity with the software engineering process. This lack of experience contributed to challenges in meeting deadlines and delivering quality results. Earlier, we thought we would be able to complete a feature along with the test in an hours time. But once we actually started doing it, we figured that it took much more than expected. To estimate future efforts for a similar project, we would consider factors such as feature complexity, technology stack, team collaboration, time management, and potential obstacles during development. We will also consider the team's experience and familiarity with the technology and processes involved, ensuring a more accurate assessment of the time and resources needed for project completion.

7. Our team is incredibly proud of how members expanded their knowledge beyond their initial domain and embraced the web development processes throughout the project. This cross-functional learning enabled us to collaborate more effectively and understand the challenges faced by other team members.

Specifically, members who initially had limited experience with front-end development learned the intricacies of UI/UX design. At the same time, those with little experience in back-end development gained insights into JSP and database management. Our team also collectively developed a deeper understanding of CI/CD processes, testing, and the importance of well-structured code and documentation.

One of the major learning movement for the team as a whole was how github can be used to create branches and work on different features at the same time without affecting the entire project. We can also use github to save our progress. We all learned that github saves so much time and effort. 

