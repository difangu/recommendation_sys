# Recommendation System
#### Devin Gu


### Recommendater System
#### System I - Average Rating

* Algorithm Overview
* Definition of "Highly-Rated"

System I - Average Rating is simply ranked based on the average rating of each movie in user-selected genre. For example, if user selects "Adventure", the algorithm will search the highest average rating in the movie dataset group by that particular genre and return top 10 highest-rated movies. It's a simplistic while intuitive way to provide recommendation. In the example, I return top 10 movies for genre adventure. 

#### System I - Vote Count

* Algorithm Overview
* Definition of Popularity

System I - Vote Count is another content-based filtering method. Here i define the popularity as the total number of vote counts for each movie. If the movie has more count, it implies more popularity is gained by the movie. The algorithm will simply aggregate all vote count for each movie and return the top 10 most-voted movies as recommendation. In the example, I return top 10 movies for genre action 

#### System II - UBCF & IBCF

* UBCF Overview: User-Based Collaborative Filtering is built on the assumption that the users with similar taste will also give the similar rating to movies. Therefore, by asking users to enter some rating for some movies, the algorithm is able to fetch users with similar tastes and therefore guess/predict the missing ratings. 
* UBCF Parameters: `parameter = list(normalize = 'Z-score',method = 'Cosine',nn = 25)` has been specified in the UBCF function. In this model, I used **Z-score normalization** that can also take variance into account. Similarity measure **Cosine** has been used with  **Nearest Neigbour of 25**.
* IBCF Overview: Item-Based Collaborative Filtering is another popular recommendation method that is built on the assumption that users will like similar items. For example, if a user likes Star Wars series then he/she will probably like Star Trek as well since these two series share many commonalities. 
* IBCF Parameters: `list(normalize = 'Center', method = 'pearson', k = 10)` has been specified in the IBCF function. In this model, I used **Center normalization**, **Pearson correlation** as similarity measure and meanwhile take **10 Nearest Neigbours** in terms of finding similar items. 
* Missing Value: There will still be missing values in the prediction. Therefore, I used a simplistic method to replace all `NA` with 2.5, which is the middle point of the scale of movie rating. This is an oversimplified way to deal with missing value, and there are many better ways. However, our purpose to build a recommender app is to only provide top 10 choices. And since we've made nearest neighbor fairly big, therefore missing value will be less severe in this case.   
* Training and Testing: I split training and testing by 80/20 and iterate the simulation 10 times. From the simulation, we will know more about the performance of each model. 
* Metric: in the simulation, i used RMSE to compare different models, and it will be shown in a dataframe. 

Credits:
My thanks go to the following persons:
1. Stefan Nicklic for his [improved implementation of collaborative filtering](https://github.com/smartcat-labs/collaboratory).
2. Stefan Wilhelm for providing [ShinyRatingInput](https://github.com/stefanwilhelm/ShinyRatingInput).
3. Dean Attali for his work on [shinyJS](https://github.com/daattali/shinyjs).
4. Kaggle user [Foxtrot](https://www.kaggle.com/zygmunt) for providing the [goodbooks dataset](https://www.kaggle.com/zygmunt/goodbooks-10k).
