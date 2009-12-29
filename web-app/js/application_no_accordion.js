var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}

Ext.onReady(function() {
 
    //Create our centre panel with tabs
    var tabs = new Ext.TabPanel({
        region:'center',
        activeTab:0,
        margins: '5 5 5 0',
        minTabWidth: 115,
        items:[{ //add an initial tab
            title: '',
            contentEl: 'center', //Get our content from the "center" div
			cls:'empty',
			bodyStyle:'background:#f1f1f1'
           
        }]
    });
 
    //Create our layout
    var viewport = new Ext.Viewport({
        layout:'border', //set the layout style. Check the Ext JS API for more styles
        defaults: {
            collapsible: false,
            split: true
        },
        items: [
		new Ext.BoxComponent({ // raw
                    region:'north',
                    el: 'north',
                    height:32
                }),{
            title:'Navigation',
            collapsible: true, //make this column collapsable
            region:'west',
            contentEl: 'west', //Get our content from the "west" div
            margins: '5 0 5 5',
            cmargins: '5 5 5 5',
            width: 175,
            minSize: 100, //set the limits for resizing
            maxSize: 250 //set the limits for resizing
        },
		new Ext.BoxComponent({ // raw
                    region:'south',
                    el: 'south',
                    height:32
                }),
	/* Add our tab panel. We could create our tab panel here like 
         * we have above but the functions below need to reference 
         * the tab panel so we use the "tabs" variable instead. */
        tabs 
        ]
    });
 

});
