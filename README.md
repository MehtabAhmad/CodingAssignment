# About this project

### Scope
This project contains a TabBar with two ViewControllers one to list Users and other to list Animals using TableView. Project fetches list of Users and Animals from two remote APIs. Pull to refresh can be use to update the lists. If an item gets tap in any of the list then detail screen appears respectively. 

<p float="left">
  <img src="https://user-images.githubusercontent.com/16016161/163126685-d93f4c7d-17df-4606-82c7-71a168a1b4da.png" width="200" />
  <img src="https://user-images.githubusercontent.com/16016161/163127062-8f4ba9af-5b50-4408-808d-6f00e9216c8b.png" width="200" /> 
  <img src="https://user-images.githubusercontent.com/16016161/163126844-885f925c-b8dc-47ee-8a1f-4d96152935d4.png" width="200" />
  <img src="https://user-images.githubusercontent.com/16016161/163126963-43511abf-8845-4040-a615-afba57b6a3fb.png" width="200" />
</p>

### What's interesting?
Interesting part in this project is it's Ploymorphic and reuseable code to illustrate separation of concerns and reuseability.

### How ?
If you review the code you'll find only single `UITableViewController` being used to show Users and Animals data without any boolean or if/else condition to know which list is currently showing, which object's data to render in cell, which API to call on Pull to referesh and which ViewController to navigate by cell tap. All the logic and dependencies being injected from out side at the time of composition so it is fully independent and can be reused with any ViewController to show list with same kind of cell.

Other noticeable thing is the data layer where data being consumed in Ploymorphic way and `ListViewModel` doen't know from where it is loading the data, data can be loaded from the remote source or from the local source without changing the code in ViewModel as ViewModel is also independent from specific context. So if tomorrow we have to save/fetch data in local DB then we only need to write new code without changing the existing one. Also API module is separated and later if we have to add new API or need to change the networking dependency then code will only change in API module.
