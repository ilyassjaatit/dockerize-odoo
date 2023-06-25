from odoo import api, fields, models


class ResConfigSettings(models.TransientModel):
    _inherit = 'res.config.settings'

    github_access_key = fields.Char("Access Key", config_parameter='github_project.access_key')