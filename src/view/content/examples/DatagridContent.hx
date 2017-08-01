package view.content.examples;

import priori.bootstrap.PriBSFormSelect;
import priori.bootstrap.PriBSFormInputText;
import priori.bootstrap.PriBSFormLabel;
import view.content.examples.datagrid.ColorCell;
import priori.view.grid.column.PriGridColumnSize.PriGridColumnSizeType;
import priori.view.grid.column.PriGridColumn;
import priori.event.PriEvent;
import priori.net.PriURLRequest;
import priori.net.PriURLLoader;
import priori.view.grid.PriDataGrid;
import priori.view.container.PriGroup;

class DatagridContent extends PriGroup {

    private var label:PriBSFormLabel;
    private var input:PriBSFormInputText;

    private var multiLabel:PriBSFormLabel;
    private var multiInput:PriBSFormSelect;

    private var grid:PriDataGrid;

    private var loadedData:Array<Dynamic>;
    private var filteredData:Array<Dynamic>;

    public function new() {
        super();
    }

    override private function setup():Void {
        this.label = new PriBSFormLabel();
        this.label.text = "Search for color name:";
        this.addChild(this.label);

        this.input = new PriBSFormInputText();
        this.input.addEventListener(PriEvent.CHANGE, onChange);
        this.addChild(this.input);

        this.multiLabel = new PriBSFormLabel();
        this.multiLabel.text = "Content Multiplier:";
        this.addChild(this.multiLabel);

        this.multiInput = new PriBSFormSelect();
        this.multiInput.data = [
            {
                val : 1,
                label : "1x"
            },
            {
                val : 2,
                label : "2x"
            },
            {
                val : 5,
                label : "5x"
            },
            {
                val : 10,
                label : "10x"
            },
            {
                val : 100,
                label : "100x"
            },
            {
                val : 1000,
                label : "1000x"
            }
        ];
        this.multiInput.addEventListener(PriEvent.CHANGE, onChange);
        this.addChild(this.multiInput);

        this.grid = new PriDataGrid();
        this.grid.columns = [
            new PriGridColumn("#", "#ROW_LINE", PriGridColumnSizeType.FIXED, 90, false),
            new PriGridColumn("Color Name", "name"),
            new PriGridColumn("Hex Value", "hex", PriGridColumnSizeType.FIXED, 90, false),
            new PriGridColumn("RGB Value", "rgb", PriGridColumnSizeType.FIXED, 130, false),
            new PriGridColumn("Color View", "hex", ColorCell, PriGridColumnSizeType.FIT, false)
        ];
        this.addChild(this.grid);

        // crayloa json thanks to jjdelc at https://gist.github.com/jjdelc/1868136
        var request:PriURLRequest = new PriURLRequest("data/crayola.json");

        var loader:PriURLLoader = new PriURLLoader();
        loader.addEventListener(PriEvent.COMPLETE, onLoad);
        loader.load(request);
    }

    override private function paint():Void {
        var space:Int = 20;

        this.label.x = space;

        this.input.x = this.label.maxX + space;
        this.input.y = space;

        this.label.centerY = this.input.centerY;



        this.multiLabel.x = this.input.maxX + space * 2;

        this.multiInput.x = this.multiLabel.maxX + space;
        this.multiInput.y = space;

        this.multiLabel.centerY = this.multiInput.centerY;


        this.grid.x = space;
        this.grid.y = this.label.maxY + space;
        this.grid.width = this.width - space*2;
        this.grid.height = this.height - this.grid.y - space;
    }

    private function onChange(e:PriEvent):Void {
        this.applyFilter(this.input.value);
    }

    private function applyFilter(value:String):Void {
        if (this.loadedData != null) {
            var i:Int = 0;
            var n:Int = this.loadedData.length;

            this.filteredData = [];

            var multi:Int = this.multiInput.selected.val;

            for (j in 0...multi) {

                i = 0;

                while (i < n) {
                    var colorName:String = this.loadedData[i].name;

                    if (value == null || value == "" || colorName.toLowerCase().indexOf(value.toLowerCase()) > -1) {
                        this.filteredData.push(this.loadedData[i]);
                    }

                    i++;
                }
            }

            this.grid.data = this.filteredData;
        }
    }

    private function onLoad(e:PriEvent):Void {
        var dataString:String = e.data;
        this.loadedData = haxe.Json.parse(dataString);

        this.applyFilter(this.input.value);
    }
}
