Template.showList.helpers
  list: ->
    Lists.findOne(Session.get('listId'))

  items: ->
    Items.find(listId: Session.get('listId'))
  
  itemsReady: ->
    Session.get('itemsReady')

Template.showList.events
  'submit .add-item': ->
      event.preventDefault()
      text = $('#newItem')
      Items.insert(
        listId: Session.get('listId'),
        text: text.val()
        createdAt: new Date()
        username: Meteor.user().username
        listSlug: Lists.findOne(Session.get('listId')).slug
        listName: Lists.findOne(Session.get('listId')).name
      )
      text.val ''
