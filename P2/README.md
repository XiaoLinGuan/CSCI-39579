
# Project 2

## Flight Delays from JFK, EWR, and LGA airports in January 2013

**To use the web app, users need to follow the steps provided:** 
1. Open Rstudio and click on `File` on the top left corner.  
2. Click on `New Project`, then click on `New Directory`.  
3. Click on `Shiny Web Application` and type in a new directory name.
4. Before copying the code from *p2.R*, we need to install the following packages.

To install, we can type `install.packages("name of the package")` in `Console`.
```R 
install.packages("DT")
install.packages("pals")
install.packages("dplyr")
install.packages("plotly")
install.packages("forcats")
install.packages("ggplot2")
install.packages("leaflet")
install.packages("shinycustomloader")
```  

To check if the packages are successfully downloaded, we can type `library("name of the package")` in `Console`.  
If the library is not successfully downloaded into the machine, the `Console` will provide an error message saying that *<span style = "color:red"> there is no package called 'name of the package'*</span>.

5. Copy the code from *p2.R* and paste it onto the file *app.R*, then click on `Run App`.  
We can also view the web app in a browser by clicking `Open in Browser` on the top left corner of the shiny web app window.  

### First Tab: Images

**Default Tab**  
User will be able to view the images of the airports and look at their exact locations on a map. 

### Second Tab: Dataset

By clicking on the second tab `Dataset`, user will be able to view the dataset containing all the information used in this web app such as carriers, origin of the flight, arrival of the flight, the dates and etc.  
User can also download the dataset by clicking `Download.csv` in the web app.

### Third Tab: Bar Chart

By clicking on the third tab 'Bar Chart`, user will be able to view the count of delayed flights from different airlines in the month of January of 2013.  
Things that the user can modify in the chart:
* The color palette of the bars.
* Sort the bars from ascending or descending height.

### Fourth Tab: Pie Chart

By clicking on the fourth tab `Pie Chart`, user will be able to compare the count of delayed flights from **departure** airports(JFK, EWR, LGA) or **arrival** airports(ATL, ORD, BOS, MCO,...).  
Things that the user can modify in the chart:
* The color palette of the slices.
* The shape of the pie chart.
* Add a border to the slices or no border.

### Fifth Tab: Line Graph

By clicking on the fifth tab `Line Graph`, user will be able to see the count of delayed flights from January 1st to January 31st of 2013.  
Things that the user can modify in the graph:
* Add the data points or without the data points.
* The color of the line and the points.
* The size of the line and the points.
* The shape of the line and the points.
