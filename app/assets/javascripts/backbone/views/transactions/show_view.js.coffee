Biftons.Views.Transactions ||= {}

class Biftons.Views.Transactions.ShowView extends Backbone.View
  template: JST["backbone/templates/transactions/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this