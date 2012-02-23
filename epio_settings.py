from pycon_project.settings.common import *
from bundle_config import config
import os.path

ADMINS = [
    ('Cezar', 'emperorcezar@gmail.com'),
]

MANAGERS = ADMINS

MEDIA_ROOT = os.path.join(config['core']['data_directory'], 'media')
