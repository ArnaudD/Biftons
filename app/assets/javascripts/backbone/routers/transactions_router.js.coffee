class Biftons.Routers.TransactionsRouter extends Backbone.Router
  initialize: (options) ->
    @transactions = new Biftons.Collections.TransactionsCollection()
    @transactions.reset options.transactions

  routes:
    "/new"      : "newTransaction"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newTransaction: ->
    @view = new Biftons.Views.Transactions.NewView(collection: @transactions)
    $("#transactions").html(@view.render().el)

  index: ->
    @view = new Biftons.Views.Transactions.IndexView(transactions: @transactions)
    $("#transactions").html(@view.render().el)

  show: (id) ->
    transaction = @transactions.get(id)
    
    @view = new Biftons.Views.Transactions.ShowView(model: transaction)
    $("#transactions").html(@view.render().el)
    
  edit: (id) ->
    transaction = @transactions.get(id)

    @view = new Biftons.Views.Transactions.EditView(model: transaction)
    $("#transactions").html(@view.render().el)
  