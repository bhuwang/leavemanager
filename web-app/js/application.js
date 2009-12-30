
Ext.BLANK_IMAGE_URL = 'ext-2.2/resources/images/default/s.gif';

Ext.onReady(function() {
 
    //Create our centre panel with tabs
    var tabs = new Ext.TabPanel({
        region:'center',
        activeTab:0,
      
        margins: '5 5 5 0',
		minTabWidth: 115,
        items:[{ //add an initial tab
		    id:'contentTab',
            title: 'Dashboard',
            contentEl: 'center', //Get our content from the "center" div
			cls:'empty',
			autoScroll:true,
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
                })
				,{
                    region:'west',
                    id:'west-panel',
                    title:'Navigator',
                    split:true,
                    width: 200,
                    minSize: 175,
                    maxSize: 400,
                    collapsible: true,
                    margins:'0 0 0 5',
                    layout:'accordion',
                    layoutConfig:{
                        animate:true
                    },
                    items: [{
					    contentEl: 'admin',
                        title:'Administration Console',
                        border:false,
                        iconCls:'settings'
                    },{
                        contentEl: 'west',
                        title:'Employee Console',
                        border:false,
                        iconCls:'settings'
                    }]
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

function setTitle(title){
 myPanelObject = Ext.getCmp('contentTab');
 myPanelObject.setTitle(title);
}



