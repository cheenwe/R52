## 列车 
rails g scaffold lc/train uuid:string code:string name:string 

## 车厢 
rails g scaffold lc/carriage train_id:integer 

## 车厢 
rails g scaffold lc/image train_id:integer  carriage_id:integer   kind:integer   file:string

## 比对 
rails g scaffold lc/compare train_id:integer  carriage_id:integer   old_file:string   new_file:string   result:integer   reason:string   result_file:string

 
