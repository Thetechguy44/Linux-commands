wget -r -p -E -k http://www.example.com

# Replace http://www.example.com with the URL of the website you want to crawl.

# -r: Recursively crawl all linked pages
# -p: Preserve the directory structure of the website
# -E: Convert HTML links to relative links
# -k: Convert links to local copies




# Method 2: Using a Scripting Language (Python)
import requests
from bs4 import BeautifulSoup

def crawl(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')

    # Extract relevant information from the page
    # ...

    # Find all links on the page
    links = soup.find_all('a', href=True)

    # Recursively crawl linked pages
    for link in links:
        new_url = link['href']
        crawl(new_url)

if __name__ == '__main__':
    start_url = 'http://www.example.com'
    crawl(start_url)



# Method 3: Using a Web Scraping Library (Scrapy)

import scrapy

class MySpider(scrapy.Spider):
    name = 'my_spider'
    allowed_domains = ['http://www.example.com']
    start_urls = ['http://www.example.com']

    def parse(self, response):
        # Extract relevant information from the page
        # ...

        # Find all links on the page
        links = response.css('a::attr(href)')

        # Recursively crawl linked pages
        for link in links:
            yield scrapy.Request(link, callback=self.parse)
