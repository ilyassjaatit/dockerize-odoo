{
    'name': 'GitHub Project Sync',
    'version': '1.0',
    'summary': 'Sync GitHub projects with Odoo',
    'description': 'This module allows you to synchronize projects from GitHub with Odoo.',
    'author': 'Your Name',
    'category': 'Services/Project',
    'depends': ['project'],
    'data': [
        'views/res_config_settings_views.xml',
        'views/project_views.xml',
    ],
    'demo': [],
    'installable': True,
    'application': True,
    'auto_install': False,
}
