
# Project 3

## NYC Dog Licensing Dashboard  

***A dashboard showing all the different dog breeds owned by new yorkers with a bar plot and the percentage of dogs owned by different boroughs/districts with a donut chart.*** 

Before we do the following steps, users need to have python3 installed in their local machines.  
  
**To use the web app, users need to follow the steps provided:**  
1. In the terminal of where we run our code, type `python3 -m venv venv` and hit `enter`. It will set up an isolated virtual environment that would contain all the necessary packages needed for a specific project.
2. After the first step, we will type `source venv/bin/activate` in the terminal and hit `enter` again. This will activate the virtual environment.  
3. Type `pip install flask` in the terminal and hit `enter`.
4. Type `pip install dash` in the terminal and hit `enter`.
5. Type `pip install pandas` in the terminal and hit `enter`.
6. After we install all the necessary packages, we will type `python p3.py` and hit `enter`. 
7. If the web app runs, our terminal will display a message saying `Dash is running on http://xxxxxxx/` and we can click on the hyperlink which will open the dashboard in our browser.

Each time we run the app, we would **repeat all the steps** except **step 3**.  
To check if flask is still in our machine, we will type `flask --version` in our terminal and hit `enter`. **If flask is in our machine, the terminal will display the message showing the current version of python and flask.**  

### Bar Plot:bar_chart:

**Default Tab**  
User will be able to see the count of each dog breed owned by new yorkers in a bar plot format. 
* User can zoom in on a specific breed or a certain part of the plot to take a closer look at the data.  

### Donut Chart![donutChart](https://img.icons8.com/office/30/000000/doughnut-chart--v1.png)

By Clicking on the second tab `Donut Chart`, user will be able to see the percentage of genders in each dog breed.  
* User can choose from 4 different variables to see the percentage of its components.  
	* BreedName - It will show the gender percentage of each breed
	* Borough - It will show the percentage of the 5 boroughs of NYC
	* Congressional District - It will show the percentage of each congressional district
	* StateSenatorial District - It will show the percentage of each state senatorial district  

### 5 Different widgets 
By scrolling up, user will be able to see the five small widgets at the bottom of the chart which contains a summary from the dataset. 

### Dataset
All the way at the bottom of the widgets are two radio buttons allowing the user to choose to view the dataset or hide the dataset.
