# City of Scottsdale Solicitations

The Solicitations dataset displays guidlines for businesses to submit bids for specific projects the city is undertaking.  Some of these seem to be recurring, such as landscaping services, others seem to be one time expenditures.  It's one of the least interesting datasets on the face of it, but I'm interested in what sorts of things I can spot.

#### EDA
+ 994 solicitations have a date of '1900-01-01'(probably a proxy for no date).  1996 seems to be the first year of normal looking dates.
+ 13 different types of solicitation exist, 'Public Bid' being the largest in number with 1432 of 5973 total.
+ In addition to bid types, 3 categories for solicitations exist:
  - 7(count of 871), null values 
  - 9(count of 5003), avg of $91K
  - 10(count of 99), avg of $3.5M
  
 #### Things to Consider:
 + The description field includes a lot of text with interesting kewords.  It would be interesting to dive into this using the Python NLTK library.
    - specific departments are often mentioned
    - very specific equipment or details services
    - in some cases the service or product is needed "immediately"


