User.create!([
  {name: "Ace", email: "ace@gmail.com", password_digest: "$2a$10$/8ZDmYOC.qnZ9rTUKBc8peDpSsagbBXzxCjlAKuzh7CmJ3U4dHHKu"}
])
Recipe.create!([
  {ingredients: "Two slices of bread", title: "Empty Sandwich", directions: "Place slices of bread next to each other.", image_url: "http://www.phoenixisstrategic.com/wp-content/uploads/2013/05/blog-empty-sandwich.jpg", prep_time: 72, user_id: 1},
  {ingredients: "Licorice", title: "Licorice", directions: "Buy licroice from store.", image_url: "http://cdn2.bigcommerce.com/server6200/aa739/product_images/uploaded_images/red-licorice.png?t=1398725710", prep_time: 120, user_id: 1},
  {ingredients: "Flour, water, mud.", title: "Mud Pie", directions: "Mix flour and water, add mud, bake at 350 degrees for 1 hour.", image_url: "http://cdn-image.myrecipes.com/sites/default/files/styles/300x300/public/image/recipes/sl/05/12/mocha-mud-pie-sl-257949-x.jpg?itok=_ChocANl", prep_time: 84, user_id: 1},
  {ingredients: "Flour, water, pepperoni, cheese", title: "Pizza", directions: "Mix flour and water, add cheese and pepperoni, shape as a heart, bake in oven on self-clean mode.", image_url: "http://twopizzapals.weebly.com/uploads/2/3/6/0/23602608/1338890_orig.jpg", prep_time: 455, user_id: 1},
  {ingredients: "Corn, cob", title: "Corn on the cob", directions: "Place corn on the cob, grill for 20 minutes, enjoy!", image_url: "http://www.scientificamerican.com/sciam/cache/file/59C0122F-509C-4FEE-99A67FC20C50CEF1.jpg", prep_time: 22, user_id: 1},
  {ingredients: "Chicken", title: "Raw Eggs", directions: "Squeeze the chicken", image_url: "http://swansonhealthcenter.com/wp-content/uploads/2011/07/Egg.jpg", prep_time: 2, user_id: 1}
])

