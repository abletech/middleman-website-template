window.UI ||= {}
class UI.MenuLink
  'use strict'

  constructor: (elemID) ->
    @menuLink = document.getElementById(elemID)

  menuLink: null

  _trapKeyUp: (e)=>
    if e.keyCode == 27
      @_closeMenu()

  _openMenu: =>
    document.body.classList.remove('js_menu_closed')
    window.addEventListener 'keyup', @_trapKeyUp

  _closeMenu: ->
    document.body.classList.add('js_menu_closed')
    window.removeEventListener 'keyup', @_trapKeyUp

  addMenuClick: =>
    @menuLink.addEventListener 'click', (e) =>
      e.preventDefault()
      if document.querySelector('body.js_menu_closed')
        @_openMenu()
      else
        @_closeMenu()

  addMaskClick: =>
    mask = document.getElementById('menu_mask')
    mask.addEventListener 'click', =>
      @_closeMenu()

  init: =>
    if @menuLink
      @addMenuClick()
      @addMaskClick()

