#!/usr/bin/env python3

from playwright.sync_api import sync_playwright

with sync_playwright() as p:
    browser = p.chromium.launch()
    page = browser.new_page()
    page.goto("https://elevplan.cloudprog.org/")
    
    course_button = page.get_by_role("button", name="H3PD")
    course_button.click()

    docs_button = page.get_by_text("16484 Softwaretest og -sikkerhed")
    docs_button.click()

    browser.close()
