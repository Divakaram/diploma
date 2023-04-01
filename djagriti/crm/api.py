
import requests
from urllib import parse
link = "http://localhost/Base/odata/standard.odata/"
response_format = {'$format': "application/json"}


def get_catalog(name, params={}, expand=""):
    params.update(response_format)
    response = requests.get(f"{link}Catalog_{name}", params=parse.urlencode(params, quote_via=parse.quote), auth=("Django", "0978"))
    return response


def get_object(name, guid, params={}):
    params.update(response_format)
    response = requests.get(f"{link}Catalog_{name}(guid'{guid}')", params=response_format, auth=("Django", "0978"))
    return response


def get_object_expand(name, guid, expand):
    response = requests.get(f"{link}Catalog_{name}(guid'{guid}')/{expand}?$format={response_format}")
    return response
