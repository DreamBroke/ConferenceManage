'use strict';

(function ($) {

    $(function () {

        var datascource = {
            'name': 'SIID',
            'children': [
                {
                    'name': '创新发展事业部', 'className': 'middle-level',
                    'children': [
                        {
                            'name': '项目管理部', 'className': 'product-dept',
                            'children': [
                                {
                                    'name': '超前研发中心', 'className': 'product-dept',
                                    'children': [
                                        {'name': '创新根据地', 'className': 'product-dept'}
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    'name': '工业设计所', 'className': 'middle-level',
                    'children': [
                        {
                            'name': '外观设计中心', 'className': 'product-dept',
                            'children': [
                                {'name': 'CMF研究中心', 'className': 'product-dept'}
                            ]
                        }
                    ]
                },
                {
                    'name': '数字工程所', 'className': 'middle-level',
                    'children': [
                        {
                            'name': '气动工程中心', 'className': 'product-dept',
                            'children': [
                                {'name': '系统工程中心', 'className': 'product-dept'}
                            ]
                        }
                    ]
                },
                {
                    'name': '教育发展平台', 'className': 'middle-level',
                    'children': [
                        {
                            'name': '国际合作部', 'className': 'product-dept',
                            'children': [
                                {'name': '教育管理部', 'className': 'product-dept'}
                            ]
                        }
                    ]
                },
                {
                    'name': '战略发展部', 'className': 'middle-level',
                    'children': [
                        {
                            'name': '公共关系中心', 'className': 'product-dept',
                            'children': [
                                {'name': '战略管理中心', 'className': 'product-dept'}
                            ]
                        }
                    ]
                },
                {
                    'name': '营商发展平台', 'className': 'middle-level',
                    'children': [
                        {
                            'name': '商务部', 'className': 'product-dept',
                            'children': [
                                {
                                    'name': '市场部', 'className': 'product-dept',
                                    'children': [
                                        {'name': '成果转化中心', 'className': 'product-dept'}
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    'name': '综合管理平台', 'className': 'middle-level',
                    'children': [
                        {
                            'name': '行政人资部', 'className': 'product-dept',
                            'children': [
                                {'name': '财资管理部', 'className': 'product-dept'}
                            ]
                        }
                    ]
                }
            ]
        };

        $('#chart-container').orgchart({
            'data': datascource,
            //'nodeContent': 'title'
            'parentNodeSymbol': 'none'
        });
        $('.orgchart').addClass('noncollapsable');
    });

})(jQuery);