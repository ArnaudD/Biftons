Biftons.Views.Transactions ||= {}

class Biftons.Views.Transactions.NewView extends Backbone.View    
  template: JST["backbone/templates/transactions/new"]
  
  events:
    "submit #new-transaction": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (transaction) =>
        @model = transaction
        window.location.hash = "/#{@model.id}"
        
      error: (transaction, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    
    this.$("form").backboneLink(@model)
    
    return this