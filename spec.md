# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (User has_many Lists)
- [x] Include at least one belongs_to relationship (Answer belongs to a Question)
- [x] Include at least one has_many through relationship (List has many Trail through List-Trails)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (trail.name)
- [x] Include reasonable validations for simple model objects (Trail name must be unique)
- [x] Include a class level ActiveRecord scope method (Trail: search_by_city, search_by_name)
- [x] Include a nested form writing to an associated model using a custom attribute writer (Lists#new, trail_attributes)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (Devise/OmniAuth - Facebook)
- [x] Include nested resource show or index (questions/1/answers/)
- [x] Include nested resource "new" form (questions/1/answers/new)
- [x] Include form display of validation errors (trails/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
