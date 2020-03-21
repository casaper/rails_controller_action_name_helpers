# Rails Controller Action Name Helpers

Simple view helpers to have more readable checks for current controller name or action name.



```haml
- # this condition here
- if action_name == 'index' && (controller_name == 'members' || controller_name == 'users')
  %p This will only show if the partial is run on the index action on the members or users controller
- # can be done like this
- if ca_index?(:members, :users)
  %p This will only show if the partial is run on the index action on the members or users controller
```

