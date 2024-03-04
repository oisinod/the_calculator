# Calculator API

## Overview

This is a simple API for performing basic mathematical calculations. The API supports simple operations like addition, subtraction, multiplication, division, exponents, and squareroot.

## Local Setup

### Prerequisites

Versions used:
- ruby 3.0.3
- Rails 7.0.8.1

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/calculator-api.git 


2.  Install dependencies:

    `bundle install`

3.  Run the Rails server:

    `rails s`

## Using the API

### Calculate

-   Endpoint: `/calculator`
-   Query Parameters:
    -   `expression` (string): The mathematical expression to calculate.
    - Accepted operators : +, -, /, * , ^, sqrt*

* expression=sqrt4

Example:

`curl http://localhost:3000/calculator?expression=2^3`

Response:


`{
"result": 8,
"expression": "2^3"
}`

Takeaways
-----------

First of all - I found this a pretty cool task, and not something I would have thought about. I came across a few hurdles while working on it, and had I more time a number of things I would definitely look into implementing or refactoring. To be honest I thought that this task would be the more straightforward one, in reality I think there were a number of hidden pitfalls ;)

The major issue was how the browser interprets characters (vs how rspec does) in a URL. Since they are interpreted differently, especially for the ^ and + symbol. I used `CGI.escape` in my `Calculator` class to ensure that it was always interpreted properly. However then I realised that '+' was being intepreted as whitespace. Which led to me just filtering for the caret operator. With more time I would have definitely tried to build a second service class which processed the URL given and *then* passed it to the Calculator class as messing with what arguments it was given should not be the responsibility of this class, and the method starts to look messy (and the tests by extension).

I took care to make sure to sanitize all strings coming in so that no code injection was possible, as opposed to the usage of something like `eval`.

I added some extra operations(which ended up being more my downfall than something to show off, as it removed the single responsibility of the calculator class that I mentioned above..), but I had major issues trying to add the modulus operator. If I spent more time working on this that would probably be the first thing I'd look into.

Thanks for reading!
