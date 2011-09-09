Biftons.Views.Transactions ||= {}

class Biftons.Views.Transactions.IndexView extends Backbone.View
  template: JST["backbone/templates/transactions/index"]
    
  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    
    @options.transactions.bind('reset', @addAll)
   
  addAll: () ->
    @options.transactions.each(@addOne)
  
  addOne: (transaction) ->
    view = new Biftons.Views.Transactions.TransactionView({model : transaction})
    @$("tbody").append(view.render().el)
       
  render: ->
    $(@el).html(@template(transactions: @options.transactions.toJSON() ))
    @addAll()
    
    return this