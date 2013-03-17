define (require, exports, module) ->
  exports.Model = Backbone.Model.extend(
    url: ->
      "/org/#{@id}"

    defaults:
      logo: "http://placehold.it/32x32",
      companyName: "Test company name",
      phone: "",
      email: "",
      address: "",
      about: ""
  )
  return