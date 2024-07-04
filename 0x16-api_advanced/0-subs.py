#!/usr/bin/python3
"""
Function that queries the Reddit API and returns the number of subscribers
(not active users, total subscribers) for a given subreddit.
If an invalid subreddit is given, the function should return 0
"""

import requests


def number_of_subscribers(subreddit):
    """
    Function that queries the Reddit API
    - If not a valid subreddit, return 0.
    """
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {'User-Agent': 'Laila Ebrahim'}
    try:
        # Make a GET request to the Reddit API
        response = requests.get(url, headers=headers, allow_redirects=False)

        # Check if the request was successful and not a redirect
        if response.status_code == 200:
            # Parse the JSON response
            data = response.json()
            # Return the number of subscribers
            return data['data']['subscribers']
        else:
            # If the subreddit is invalid or not found, return 0
            return 0
    except Exception:
        # If any error occurs during the process, return 0
        return 0
