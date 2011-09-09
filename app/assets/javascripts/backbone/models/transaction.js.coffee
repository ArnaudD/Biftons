class Biftons.Models.Transaction extends Backbone.Model
  paramRoot: 'transaction'

  defaults:
    name: null
    amount: null
    date: null
  
class Biftons.Collections.TransactionsCollection extends Backbone.Collection
  model: Biftons.Models.Transaction
  url: '/transactions'