Feature: JSON placeholder posts

	Scenario: List all JSON placeholder posts
		Given the client requests a list of posts
		Then the response is a list containing 100 posts
		And 1 post has the following attributes:
			| attribute | type   | value 	|
			| userId	| Integer|1			|
		    | id    	| Integer|1			|
		    | title		| String |	sunt aut facere repellat provident occaecati excepturi optio reprehenderit	|
		    | body		| String |	quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto	|