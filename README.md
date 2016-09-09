== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

###Ruby version  
2.3.0

###System dependencies  
rails 4.2.5

###Database Assosiation  

users  
 has_many :prototypes  
 has_many :comments  

prototypes  
 belongs_to :user  
 has_many :prototype_images  
 has_many :comments  
 has_many :likes  

prototype_images  
 belongs_to :prototype  

comments  
 belongs_to :user  
 belongs_to :prototype  

likes  
 belongs_to :user  
 belongs_to :prototype  



###Database creation  

|users|type  
|:----|:---  
|name|:str  
|avatar|:str  
|profile|:text  
|works|:str  
|member_of|:str  

|prototypes|type  
|:---------|:---  
|user_id|:integer  
|title|:str  
|catch_copy|:str  
|concept|:text  

|prototype_images|type  
|:-------|:---  
|prototype_id|:integer  
|content|:str  
|status|:integer  

|comments|type  
|:-------|:---  
|user_id|:integer  
|prototype_id|:integer  
|article|:text  

|likes|type  
|:----|----  
|user_id|:integer  
|prototype_id|:integer  
