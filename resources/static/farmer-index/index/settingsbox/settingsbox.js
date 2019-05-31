// SETTINGS BOX

$(document).ready(function(){
    $('.customPanel').each(function(){
        var t_toggle_time = 500;   //duration of the panel toggle animation in milisecons
        var t_menu_fonts = [   //fonts data (name, link and css) for the top menu
            {
                name:"Lato",
                link:"http://fonts.useso.com/css?family=Lato:300,400,700",
                css:"'Lato', sans-serif"
            },
            {   
                name:"Metrophobic",
                link:"http://fonts.useso.com/css?family=Metrophobic",
                css:"'Metrophobic', sans-serif"
            },
            {
                name:"Telex",
                link:"http://fonts.useso.com/css?family=Telex>",
                css:"'Telex', sans-serif"
            },
            {
                name:"Questrial",
                link:"http://fonts.useso.com/css?family=Questrial",
                css:"'Questrial', sans-serif"
            },
            {
                name:"Open sans",
                link:"http://fonts.useso.com/css?family=Open+Sans:400,700,300",
                css:"'Open Sans', sans-serif"
            },
            {
                name:"Oxygen",
                link:"http://fonts.useso.com/css?family=Oxygen",
                css:"'Oxygen', sans-serif"
            },
            {
                name:"Gudea",
                link:"http://fonts.useso.com/css?family=Gudea:400,700",
                css:"'Gudea', sans-serif"
            },
            {
                name:"Imprima",
                link:"http://fonts.useso.com/css?family=Imprima",
                css:"'Imprima', sans-serif"
            },
            {
                name:"Ubuntu",
                link:"http://fonts.useso.com/css?family=Ubuntu:300,400,700",
                css:"'Ubuntu', sans-serif"
            },
            {
                name:"Pontano sans",
                link:"http://fonts.useso.com/css?family=Pontano+Sans",
                css:"'Pontano Sans', sans-serif"
            },
            {
                name:"Ropa sans",
                link:"http://fonts.useso.com/css?family=Ropa+Sans",
                css:"'Ropa Sans', sans-serif"
            },
            {
                name:"Oswald",
                link:"http://fonts.useso.com/css?family=Oswald:400,700,300",
                css:"'Oswald', sans-serif"
            },
            {
                name:"Armata",
                link:"http://fonts.useso.com/css?family=Armata",
                css:"'Armata', sans-serif"
            },
            {
                name:"Numans",
                link:"http://fonts.useso.com/css?family=Numans",
                css:"'Numans', sans-serif"
            },
            {
                name:"Asap",
                link:"http://fonts.useso.com/css?family=Asap:400,700",
                css:"'Asap', sans-serif"
            }
        ];
        var t_text_fonts = [   //fonts data (name, link and css) for text
            {
                name:"Open sans",
                link:"http://fonts.useso.com/css?family=Open+Sans:400,700,300",
                css:"'Open Sans', sans-serif"
            },
			{
                name:"Lato",
                link:"http://fonts.useso.com/css?family=Lato:300,400,700",
                css:"'Lato', sans-serif"
            },
			{
                name: "PT Sans Narrow",
                link: "http://fonts.useso.com/css?family=PT+Sans+Narrow",
                css: "'PT Sans Narrow', sans-serif"
            },
            {
                name:"Varela",
                link:"http://fonts.useso.com/css?family=Varela",
                css:"'Varela', sans-serif"
            },
            {
                name:"Droid sans",
                link:"http://fonts.useso.com/css?family=Droid+Sans:400,700",
                css:"'Droid Sans', sans-serif"
            },

            {
                name:"Pt Sans Caption",
                link:"http://fonts.useso.com/css?family=PT+Sans+Caption:400,700",
                css:"'PT Sans Caption', sans-serif"
            },
            {
                name:"Magra",
                link:"http://fonts.useso.com/css?family=Magra:400,700",
                css:"'Magra', sans-serif"
            },
            {
                name:"Chivo",
                link:"http://fonts.useso.com/css?family=Chivo",
                css:"'Chivo', sans-serif"
            },
            {
                name:"Verdana",
                link:"",
                css:"'Verdana', sans-serif"
            },
            {
                name:"Tahoma",
                link:"",
                css:"'Tahoma', sans-serif"
            },
            {
                name:"Arial",
                link:"",
                css:"'Arial', sans-serif"
            }
        ];
        var t_title_fonts = [   //fonts data (name, link and css) for title
			{
                name: "Oswald",
                link: "http://fonts.useso.com/css?family=Oswald:400,300,700",
                css: "'Oswald', sans-serif"
            },
            {
                name: "PT Sans Narrow",
                link: "http://fonts.useso.com/css?family=PT+Sans+Narrow",
                css: "'PT Sans Narrow', sans-serif"
            },
            {
                name:"Varela",
                link:"http://fonts.useso.com/css?family=Varela",
                css:"'Varela', sans-serif"
            },
            {
                name:"Open sans",
                link:"http://fonts.useso.com/css?family=Open+Sans:400,700,300",
                css:"'Open Sans', sans-serif"
            },
            {
                name:"Lato",
                link:"http://fonts.useso.com/css?family=Lato:300,400,700",
                css:"'Lato', sans-serif"
            },
            {
                name:"Droid sans",
                link:"http://fonts.useso.com/css?family=Droid+Sans:400,700",
                css:"'Droid Sans', sans-serif"
            },
            {
                name:"Pt Sans Caption",
                link:"http://fonts.useso.com/css?family=PT+Sans+Caption:400,700",
                css:"'PT Sans Caption', sans-serif"
            },
            {
                name:"Magra",
                link:"http://fonts.useso.com/css?family=Magra:400,700",
                css:"'Magra', sans-serif"
            },
            {
                name:"Chivo",
                link:"http://fonts.useso.com/css?family=Chivo",
                css:"'Chivo', sans-serif"
            },
            {
                name:"Verdana",
                link:"",
                css:"'Verdana', sans-serif"
            },
            {
                name:"Tahoma",
                link:"",
                css:"'Tahoma', sans-serif"
            },
            {
                name:"Arial",
                link:"",
                css:"'Arial', sans-serif"
            }
        ];
        var t_menu_css = $('#header .topmenu li a');   //selector for elements to change menu font
        var t_text_css = $('body');   //selector for elements to change text font
        var t_title_css = $('.container .title, .container #subscribe .subscribebutton, .container #miniportfolio .time, .container #miniportfolio h3, #project h3, #footer h3');   //selector for elements to change title font
        var t = $(this);
        var t_width = t.outerWidth(true);
        var t_options = t.children('.customPanelOptions');
        var t_menu_font_select = t_options.children('select[name="menu-font"]');
        var t_text_font_select = t_options.children('select[name="text-font"]');
        var t_title_font_select = t_options.children('select[name="title-font"]');
        var t_button = t.children('.customPanelButton');
        var t_default = t_options.children('.customPanelOptionsDefault');
        var t_color = t_options.children('.customPanelOptionsColor');
        var t_color_default = '#f1f1f1';   //default background color
        var t_color_default_site = '#28B8FF';   //default site color
        var t_texture = t_options.children('.customPanelOptionsTexture');
        var t_layout_changed = false;
        var t_color_current_class = '';
        var t_texture_current_class = '';
        var t_change_backgroundcolor = $('body');   //elements for which to change the background
        var t_dom = $('');   //elements for which to change the layout
        var t_picker_button = t_options.children('.customPanelOptionsPickerButton.customPanelOptionsPickerButtonBackground');
        var t_picker_button_site = t_options.children('.customPanelOptionsPickerButton.customPanelOptionsPickerButtonSite');
        var t_picker_box = $('.customPanelOptionsPicker.customPanelOptionsPickerBackground');
        var t_picker_box_site = $('.customPanelOptionsPicker.customPanelOptionsPickerSite');
        var t_picker = $.farbtastic('.customPanelOptionsPicker.customPanelOptionsPickerBackground');
        var t_picker_site = $.farbtastic('.customPanelOptionsPicker.customPanelOptionsPickerSite');
        var t_style = $('<style>');
        $('head').append(t_style);
        t_picker.setColor(t_color_default);
        t_picker_site.setColor(t_color_default_site);
        t_picker.linkTo(function(color){
            t_boxed_layout_function();
            if(t_color_current_class!=''){
                t_change_backgroundcolor.removeClass(t_color_current_class);
                t_color_current_class = '';
            }
            t_change_backgroundcolor.css('background-color',color);
        });
        t_picker_site.linkTo(function(color){
            t_style.empty();
            t_style.html('.postvideo{background-color:'+color+';}a:hover{color:'+color+';}#topline .content .social li img:hover{background:'+color+';}#bottomarea .social li img:hover{background:'+color+';}#header .logo span{color:'+color+';}.path span a:hover{color:'+color+';}#header .topmenu li:hover, #header .topmenu li.active{border-top-color:'+color+';border-bottom-color:'+color+';}#header .topmenu li:hover{background-color:'+color+';}#header .topmenu li.active{background-color:'+color+';}#topline .content .searchbutton{background-color:'+color+';}.work:hover{background-color:'+color+';border-bottom-color:'+color+';}.newpost h2{background-color:'+color+';}.project h2{background-color:'+color+';}.post h3{background-color:'+color+';}#footer h2{background-color:'+color+';}#footer h2 span{color:'+color+';}#footer ul.twitter li{background-color:'+color+';}#header ul li:hover ul.MenuDropdown li:hover>a{background:'+color+' !important;}.post .postinfo .posttype{background:'+color+';}.skywalkerSlider .skywalkerSliderMarker{background:'+color+';}.newpost:hover .viewpost{background:'+color+';}.posttext{background-color:'+color+';}.postphoto{background-color:'+color+';}.post .postinfo a:hover{color:'+color+';}.post .viewlink a{color:'+color+';}#comments .date a:hover{color:'+color+';}.skywalkerSlider .skywalkerSliderContent .skywalkerSliderContentItem .skywalkerSliderContentItemBox .skywalkerSliderContentItemBoxInfo .skywalkerSliderContentItemBoxInfoTitle .skywalkerSliderContentItemBoxInfoTitleBackground{background-color:'+color+';}');
        });
        t_picker_button.click(function(){
            t_picker_box_site.hide();
            t_picker_box.toggle();
        });
        t_picker_button_site.click(function(){
            t_picker_box.hide();
            t_picker_box_site.toggle();
        });
        var t_normal_layout_function = function(){
            if(t_layout_changed){
                t_change_backgroundcolor.removeClass(t_color_current_class).removeClass(t_texture_current_class);
                t_dom.removeClass('backwrapper');
                t_color_current_class = '';
                t_texture_current_class = '';
                t_change_backgroundcolor.css('background-color','');
                t_picker.setColor(t_color_default);
                t_layout_changed = false;
            }
        }
        var t_boxed_layout_function = function(){
            if(!t_layout_changed){
                t_dom.addClass('backwrapper');
                t_layout_changed = true;
            }
        }
        t_button.click(function(){
            if(t.hasClass('customPanelClosed'))
                t.removeClass('customPanelClosed').stop().animate({left:'0px'},{queue:false,duration:t_toggle_time});
            else{
                t.addClass('customPanelClosed').stop().animate({left:'-195px'},{queue:false,duration:t_toggle_time});
                t_picker_box.hide();
                t_picker_box_site.hide();
            }
        });
        t_default.click(function(){
            t_normal_layout_function();
        });
        t_color.click(function(){
            t_boxed_layout_function();
            var t_color_current = $(this);
            var t_color_current_class_new = t_color_current.attr('class').split(' ')[1];
            if(t_color_current_class_new!=t_color_current_class){
                if(t_color_current_class=='')
                    t_change_backgroundcolor.css('background-color','');
                t_change_backgroundcolor.removeClass(t_color_current_class).addClass(t_color_current_class_new);
                t_color_current_class = t_color_current_class_new;
                t_picker.setColor(colorToHex(t_color_current.css('background-color')));
            }
        });
        t_texture.click(function(){
            t_boxed_layout_function();
            var t_texture_current = $(this);
            var t_texture_current_class_new = t_texture_current.attr('class').split(' ')[1];
            if(t_texture_current_class_new!=t_texture_current_class){
                t_change_backgroundcolor.removeClass(t_texture_current_class).addClass(t_texture_current_class_new);
                t_texture_current_class = t_texture_current_class_new;
            }
        });
        var i;
        for(i=0;i<t_menu_fonts.length;i++)
            t_menu_font_select.append('<option value="'+i+'">'+t_menu_fonts[i].name+'</option>');
        for(i=0;i<t_text_fonts.length;i++)
            t_text_font_select.append('<option value="'+i+'">'+t_text_fonts[i].name+'</option>');
        for(i=0;i<t_title_fonts.length;i++)
            t_title_font_select.append('<option value="'+i+'">'+t_title_fonts[i].name+'</option>');
        var t_menu_font_link = $('.TopmenuFont');
        var t_text_font_link = $('.TextFont');
        var t_title_font_link = $('.TitleFont');
        t_menu_font_select.change(function(){
            var t_font_index = parseInt(t_menu_font_select.val());
            t_menu_font_link.attr('href',t_menu_fonts[t_font_index].link);
            t_menu_css.css('font-family',t_menu_fonts[t_font_index].css);
        });
        t_text_font_select.change(function(){
            var t_font_index = parseInt(t_text_font_select.val());
            t_text_font_link.attr('href',t_text_fonts[t_font_index].link);
            t_text_css.css('font-family',t_text_fonts[t_font_index].css);
        });
        t_title_font_select.change(function(){
            var t_font_index = parseInt(t_title_font_select.val());
            t_title_font_link.attr('href',t_title_fonts[t_font_index].link);
            t_title_css.css('font-family',t_title_fonts[t_font_index].css);
        });
    });
});
function colorToHex(color) {
    if (color.substr(0, 1) === '#') {
        return color;
    }
    var digits = /(.*?)rgb\((\d+), (\d+), (\d+)\)/.exec(color);
    
    var red = parseInt(digits[2]);
    var green = parseInt(digits[3]);
    var blue = parseInt(digits[4]);
    
    var rgb = blue | (green << 8) | (red << 16);
    return digits[1] + '#' + rgb.toString(16);
};