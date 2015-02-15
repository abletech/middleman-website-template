window.UI ||= {}
class UI.MenuLink
  'use strict'

  constructor: (elemID) ->
    @menuLink = document.getElementById(elemID)

  menuLink: null

  addMenuClick: =>
    @menuLink.addEventListener 'click', (e) ->
      e.preventDefault()
      document.body.classList.toggle('menu_closed')

  init: =>
    @addMenuClick() if @menuLink
