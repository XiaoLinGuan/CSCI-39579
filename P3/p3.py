import dash
import dash_table
from pandas.io.formats import style
from pandas.core.frame import DataFrame
from dash_table.Format import Format
from dash.dependencies import Input, Output
import dash_core_components as dcc
import dash_html_components as html
import plotly.express as px
import pandas as pd

# This dataframe contains 5000 rows, and 14 columns.
df = pd.read_csv('randomSampleMod.csv')

# Get a list of the breeds
breed_names = df.BreedName.unique()

# Get the frequency count of all the breeds
df1 = df.groupby(['BreedName']).count().reset_index()

# Get the frequency count of each gender from each breed
df2 = df.groupby(['BreedName', 'AnimalGender']).size().reset_index(name = 'Count')
df2.columns = ['Breed', 'Gender', 'Count'] 

# Get the frequency count of boroughs in column 'Borough'
df3 = df['Borough'].value_counts()
df3.to_csv('df3.csv')
df3 = pd.read_csv('df3.csv')
df3.columns = ['Borough', 'Count']

# Get the frequency count of congressional districts in column 'CongressionalDistrict'
df4 = df['CongressionalDistrict'].value_counts()
df4.to_csv('df4.csv')
df4 = pd.read_csv('df4.csv')
df4.columns = ['Congressional District#', 'Count']

# Get the frequency count of state senatorial districts in column 'StateSenatorialDistrict'
df5 = df['StateSenatorialDistrict'].value_counts()
df5.to_csv('df5.csv')
df5 = pd.read_csv('df5.csv')
df5.columns = ['State Senatorial District#', 'Count']

# Get the frequency count of Animal name
col1 = df.groupby(['AnimalName']).size().reset_index(name = 'Count')
col1.columns = ['Name', 'Count']

# Get the frequency count of each zip code
col4 = df.groupby(['ZipCode']).size().reset_index(name = 'Count')
col4.columns = ['ZipCode', 'Count']

# Get the frequency count of each community district
col5 = df.groupby(['CommunityDistrict']).size().reset_index(name = 'Count')
col5.columns = ['Community District #', 'Count']

app = dash.Dash()

# Style of all tabs
tabs_styles = {
	'height': '50px',
	'fontWeight': 'bold',
	'font-size': '160%',
	'align-items': 'center',
	'justify-content': 'center'
}

# Tab Style of Barplot
bar_tab_selected_style = {
	'borderTop': '3px solid #FF99CC',
	'borderBottom': '3px solid #FF99CC',
	'borderLeft': '3px solid #FF99CC',
	'borderRight': '3px solid #FF99CC',
	'backgroundColor': '#FFCCCC',
	'fontWeight': 'bold',
	'color': '#CC3333'
}

# Tab Style of Donut Chart
pie_tab_selected_style = {
	'borderTop': '3px solid #6666FF',
	'borderBottom': '3px solid #6666FF',
	'borderLeft': '3px solid #6666FF',
	'borderRight': '3px solid #6666FF',
	'backgroundColor': '#99CCFF',
	'fontWeight': 'bold',
	'color': '#003399' 
}

# Table Contents
table_content = html.Div([
	html.Table([
		html.Thead([
			html.Tr([

				# First Column
				html.Th([
						html.H2(['Top 3 Names:'], style = {'font-size': '30px', 'text-shadow': '2px 2px 5px #660000'}),
						html.H2('1. Bella'),
						html.H2('2. Max'),
						html.H2('3. Coco')
					],
					style = {
						'border': '3px solid #FF6666',
						'border-radius': '7px',
						'backgroundColor': '#FFA07A',
						'color': '#330000', 
						'width': '15%'
					}
				),

				# Second Column
				html.Th([
					html.H2(['Top 5 Breeds:'], style = {'font-size': '30px', 'text-shadow': '2px 2px 5px #A52A2A'}),
					html.H2('1. Yorkshire Terrier'),
					html.H2('2. Shih Tzu'),
					html.H2('3. Chihuahua'),
					html.H2('4. Labrador Retriever'),
					html.H2('5. Maltese')
					],
					style = {
						'border': '3px solid #CC6600',
						'border-radius': '7px',
						'backgroundColor': '#FF9933',
						'color': '#660000',
						'width': '15%',
					}
				),

				# third Column
				html.Th([
					html.Div([
						html.H2(['Which breed has the most females(excluding unknown breeds):'],
						style = {'font-size': '30px', 'text-shadow': '1px 1px 5px #993300'}),
						html.H2('Yorkshire Terrier')
						], style = {'borderBottom': '2px dotted #333333'}), # Add a border to divide the two questions.

					html.H2(['Which breed has the most males(excluding unknown breeds):'],
						style = {'font-size': '30px', 'text-shadow': '1px 1px 5px #993300'}),					
					html.H2('Shih Tzu')
					],
					style = {
						'border': '3px solid #999900',
						'border-radius': '7px',
						'backgroundColor': '#CCCC33',
						'color': '#663300',
					}
				),

				# Fourth Column
				html.Th([
					html.H2(['Top 5 Zip Codes:'], style = {'font-size': '30px', 'text-shadow': '2px 2px 5px #006633'}),
					html.H2('1. 10025'),
					html.H2('2. 10023'),
					html.H2('3. 10128'),
					html.H2('4. 10024'),
					html.H2('5. 10011')
					],
					style = {
						'border': '3px solid #669933',
						'border-radius': '7px',
						'backgroundColor': '#99CC66',
						'color': '#003300',
						'width': '15%'
					}
				),

				# Fifith Column
				html.Th([
					html.H2(['Top 3 Community District:'], style = {'font-size': '30px', 'text-shadow': '2px 2px 5px #0066CC'}),
					html.H2(['1. District#108']),
					html.H2(['2. District#107']),
					html.H2(['3. District#503'])
					],
					style = {
						'border': '3px solid #339999',
						'border-radius': '7px',
						'backgroundColor': '#66CCCC',
						'color': '#003366',
						'width': '15%'
					}
				)
			])
		])
	])
])

app.layout = html.Div([
	# Title of the dashboard
	html.H1(
		['NYC Dog Licensing Dashboard'],
		style = {
			'height': '50px',
			'font-size': '40px',
			'text-align': 'center',
			'background-image': 'linear-gradient(to right, #FFFF99, #99FFCC)'
		}
	),

	# Tabs
	html.Div([
		dcc.Tabs(id = 'tabs', value = 'tab1',	# Default tab is Barplot
			children = [ 
				dcc.Tab(label = 'Barplot', value = 'tab1', selected_style = bar_tab_selected_style),			
				dcc.Tab(label = 'Donut Chart', value = 'tab2', selected_style = pie_tab_selected_style)
			], style = tabs_styles),
		html.Div(id = 'tabs-content')
	]), 

	# Options for Pie Char Only
	html.Div([
		html.H3('Column:'),
		dcc.Dropdown(
			id = 'pie_chart_option1',
			value = 'BreedName',
			options = [{'value': x, 'label': x} 
				for x in ['BreedName', 'Borough', 'CongressionalDistrict', 'StateSenatorialDistrict']],
			clearable = False
		),
		html.Div([
			html.H4('Name:'),
			dcc.Dropdown(	
				id = 'breed_name',
				options = [{'value': x, 'label': x} for x in breed_names])
		],id = 'breed_name_only')
	], id = 'hideable_options'),

	# Aggregated Information from the dataset.
	html.Div([
		html.Br(),
		html.Hr(),
		table_content,
		html.Hr(),
		html.Br(),
		html.Br()
	]),

	# By default, the dataset is hidden.
	html.Div([
		dcc.RadioItems(
			id = 'dataset1',
			labelStyle = {'font-size': '130%', 'display': 'inline-block'},
			options = [{'label': 'Show Dataset', 'value': 'show_dataset'},
							{'label': 'Hide Dataset', 'value': 'hide_dataset'}],
			value = 'hide_dataset'
		),
	]),

	# Dataset
	html.Div([
		html.H2('NYC Dog Licensing Dataset', style = {'color': 'saddleBrown'}),
		dash_table.DataTable(
			id = 'datatable1',
			data = df.to_dict('records'),
			filter_action = 'native',
			columns = [{'name': i, 
							'id': i,
							'type': 'numeric',
							'format': Format(nully = 'N/A')
							} for i in df.columns
						],

			# Header
			fixed_rows = {'headers': True},
			style_header_conditional = [
				# Background colors in yellow
				{'if':{'column_id': 'AnimalName'}, 'backgroundColor': '#FFFFCC'},
				{'if':{'column_id': 'AnimalGender'}, 'backgroundColor': '#FFFF99'},
				{'if':{'column_id': 'AnimalBirthMonth'}, 'backgroundColor': '#FFFF66'},
				{'if':{'column_id': 'BreedName'}, 'backgroundColor': '#FFFF33'},

				# Background colors in green
				{'if':{'column_id': 'Borough'}, 'backgroundColor': '#99FF99'},
				{'if':{'column_id': 'ZipCode'}, 'backgroundColor': '#66FF66'},

				# Background colors in blue
				{'if':{'column_id': 'CommunityDistrict'}, 'backgroundColor': '#CCFFFF'},
				{'if':{'column_id': 'CensusTract2010'}, 'backgroundColor': '#99FFFF'},
				{'if':{'column_id': 'NTA'}, 'backgroundColor': '#66FFFF'},
				{'if':{'column_id': 'CityCouncilDistrict'}, 'backgroundColor': '#00FFFF'}, 
				{'if':{'column_id': 'CongressionalDistrict'}, 'backgroundColor': '#00CCCC'},
				{'if':{'column_id': 'StateSenatorialDistrict'}, 'backgroundColor': '#009999'},

				# Background colors in purple
				{'if':{'column_id': 'LicenseIssuedDate'}, 'backgroundColor': '#CC99FF'},
				{'if':{'column_id': 'LicenseExpiredDate'}, 'backgroundColor': '#9966CC'}
			],
			style_header = {'border': '1px solid black'},	# Border in black

			# Cells
			style_cell_conditional = [
				{'if':{'column_id': 'AnimalName'}, 'width': '6%'},
				{'if':{'column_id': 'AnimalGender'}, 'width': '6%'},
				{'if':{'column_id': 'AnimalBirthMonth'}, 'width': '10%'},
				{'if':{'column_id': 'BreedName'}, 'width': '12%'},
				{'if':{'column_id': 'Borough'}, 'width': '6%'},
				{'if':{'column_id': 'ZipCode'}, 'width': '5%'},
				{'if':{'column_id': 'CommunityDistrict'}, 'width': '8%'},
				{'if':{'column_id': 'CensusTract2010'}, 'width': '8%'},
				{'if':{'column_id': 'NTA'}, 'width': '3%'},
				{'if':{'column_id': 'LicenseIssuedDate'}, 'width': '8%'},
				{'if':{'column_id': 'LicenseExpiredDate'}, 'width': '8%'}
			],
			style_cell = {'textAlign': 'left', 'border': '1px solid black'},	# Border in black

			page_size = 20,
			style_table = {'height': '300px', 'overflowY': 'auto'},
		)
	], id = 'hideable_dataset')
])

# Hide Pie chart options when user click on Barplot.
@app.callback(Output('hideable_options', 'style'),
					Input('tabs', 'value'))

def options(tabs):
	if tabs == 'tab1':
		return {'display': 'none'}

# Hide Breed Names and Gender when user click on other options.
@app.callback(Output('breed_name_only', 'style'),
					Input('pie_chart_option1', 'value'))

def option1(pie_chart_option1):
	if pie_chart_option1 != 'BreedName':
		return {'display': 'none'}

# Show the plot when user click on the tab.
@app.callback(Output('tabs-content', 'children'),
					[Input('tabs', 'value'),
					Input('pie_chart_option1', 'value'),
					Input('breed_name', 'value')])

def graphs(tabs, pie_chart_option1, breed_name):
	# Barplot of the dog breed
	if tabs == 'tab1':
		fig1 = px.bar(df1, 
			x = 'BreedName',
			y = df.groupby(['BreedName']).size(),
			color = 'BreedName',
			height = 600,
			labels = {
				'x': 'Breed Name', 
				'y': 'Count'},
			title = 'The number of each breed owned by New Yorkers'
		)
		return dcc.Graph( 
			figure = fig1
		)

	# Pie Chart with different options
	elif tabs == 'tab2':
		if pie_chart_option1 == 'BreedName':
			if breed_name == None:
				fig2 = px.pie(df2,
					values = 'Count',
					names = 'Gender',
					title = 'Gender Percentage of all breeds',
					color_discrete_sequence = ['#00B5F7', '#E48F72',],
					hole = 0.3
				)
			else: 
				mod_fig2 = df2.loc[df2['Breed'] == breed_name]
				fig2 = px.pie(mod_fig2,
					values = 'Count',
					names = 'Gender',
					title = 'Gender Percentage of each breed',
					color_discrete_sequence = ['#00B5F7', '#E48F72'],
					hole = 0.3
				)
		elif pie_chart_option1 == 'Borough':
			fig2 = px.pie(df3,
				values = 'Count',
				names = 'Borough',
				title = 'Percentage of dogs owned by each borough in NYC',
				color_discrete_sequence = px.colors.sequential.Electric,
				hole = 0.4
			)
		elif pie_chart_option1 == 'CongressionalDistrict': 
			fig2 = px.pie(df4,
				values = 'Count',
				names = 'Congressional District#',
				title = 'Percentage of dogs owned by each Congressional District in NYC',
				color_discrete_sequence = px.colors.sequential.haline,
				hole = 0.4
			)
		elif pie_chart_option1 == 'StateSenatorialDistrict':
			fig2 = px.pie(df5,
				values = 'Count',
				names = 'State Senatorial District#',
				title = 'Percentage of dogs owned by each State Senatorial District in NYC',
				color_discrete_sequence = px.colors.sequential.solar,
				hole = 0.4
			)
		return dcc.Graph(
			figure = fig2
		)

# Show or Hide Dataset.
@app.callback(Output('hideable_dataset', 'style'), 
				Input('dataset1', 'value'))

def table(dataset1):
	if dataset1 == 'hide_dataset':
		return {'display': 'none'}

if __name__ == '__main__':
	app.run_server(debug = True)