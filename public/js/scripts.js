console.log('scripts loaded');

var token = $('#api-token').val();

$.ajaxSetup({
    headers:{
        "accept": "application/json",
        "token": token
    }
});

//Models
var ListEntry = Backbone.Model.extend({});


//Collection
var ListEntryCollection = Backbone.Collection.extend({
    model: ListEntry,
    url: '/api/list_entries'
});


//Views
var ListEntryView = Backbone.View.extend({
    tagName: 'div',
    className: 'list_entry',
    template: _.template( $('#list_entry-template').html() ),
    render: function(){
        this.$el.empty();
        var html = this.template( this.model.toJSON() );
        var $html = $( html );
        this.$el.append( $html );
    },
    events:{
        'click button.remove': 'removeListEntry'
    },
    removeListEntry: function(){
        this.model.destroy();
        this.$el.remove();
    }
});

var ListEntryListView = Backbone.View.extend({
    initialize: function(){
        this.listenTo(this.collection, 'add', this.render);
    },
    render: function(){
        this.$el.empty();
        var list_entries = this.collection.models;
        var view;
        for (var i = 0; i < list_entries.length; i++){
            view = new ListEntryView({model: list_entries[i]});
            view.render();
            this.$el.append( view.$el );
        }
    }
});



var list_entries = new ListEntryCollection();
var listEntryPainter = new ListEntryListView({
    collection: list_entries,
    el: $('#list_entries-list')
});

list_entries.fetch();

$('form.create-list_entry').on('submit', function(e){
    e.preventDefault();
    var newName = $(this).find("#my-name").val();
    var newEmail = $(this).find("#my-email").val();
    list_entries.create({name: newName, email: newEmail});

});
