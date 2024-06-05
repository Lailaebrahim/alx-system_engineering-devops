#!/usr/bin/python3
"""a recursive function that queries the Reddit API and
   returns a list containing
   the titles of all hot articles for a given subreddit.
   If no results are found for the given subreddit,
   the function should return None.
   """

import requests


def recurse(subreddit, hot_list=[], after="", count=0):
    """Returns a list of titles of all hot posts on a given subreddit."""
    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    header = {'User-agent': 'Laila Ebrahim'}
    params = {
        "after": after,
        "count": count,
        "limit": 200
    }
    if hot_list is None:
        hot_list = []
    response = requests.get(url, headers=header, params=params,
                            allow_redirects=False)
    if response.status_code == 404:
        return None
    try:
        results = response.json().get("data")
        after = results.get("after")
        count += results.get("dist")
        for child in results.get("children"):
            hot_list.append(child.get("data").get("title"))

        if after is not None:
            return recurse(subreddit, hot_list, after, count)
        return hot_list
    except Exception:
        return hot_list
