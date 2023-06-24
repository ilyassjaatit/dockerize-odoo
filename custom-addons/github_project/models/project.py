from odoo import models, fields


class Project(models.Model):
    _inherit = "project.project"

    sync_github_project = fields.Boolean(string='Sync GitHub Project', help='Enable GitHub project synchronization')
