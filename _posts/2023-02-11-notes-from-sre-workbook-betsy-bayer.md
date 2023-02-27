---
layout: post
title: "Notes from The Site Reliability Workbook - Betsy Beyer"
date: 2023-02-11 09:00:00 +1000
tags: sre
---

<img src="assets/images/lights-at-night.jpeg" alt="lights-at-night" width="100%"/>

# Foreword I

Indeed, the book might be summarized as follows:

- Commit to clear promises that set service objectives, expectations, and levels.
- Assess those promises continuously, with metrics and budgetary limits.
- React quickly to keep and repair promises, be on-call, and guard autonomy to avoid new gatekeepers.

Remarkably, the human aspects of human-computer systems only grow alongside the perceived menace of scale: it turns out that automation doesn't eliminate humans, after all; rather, it challenges us to reassert human needs across all scales, from the genesis of an individual idea to the massive deployments on behalf of a global user base.

# Foreword II

DevOps symbolizes aspects of the emergent and existential optimizations required to rapidly deliver highly available software over the internet.

CAMS for Culture, Automation, Metrics, and Sharing. Jez Humble later expanded this acronym to CALMS by adding Lean continuous improvement.

Now I define DevOps simply as "optimizing human performance and experience operating software, with software, and with humans." I don't want to put words in anyone's mouth, but that seems like a great way to describe SRE as well.

# Foreword III

SRE is usually framed as how Google does operations, but that misses the bigger picture: SRE in practice enables software engineering, but also transforms architecture, security, governance, and compliance.

# Preface

SRE is a journey as much as it is a discipline.

# Chapter 1 - How SRE Relates to DevOps

---

`class SRE implements interface DevOps`

## Background on DevOps

DevOps is a loose set of practices, guidelines, and culture designed to break down silos in IT development, operations, networking, and security. Articulated by John Willis, Damon Edwards, and Jez Humble, CA(L)MS—which stands for Culture, Automation, Lean (as in Lean management; also see continuous delivery), Measurement, and Sharing—is a useful acronym for remembering the key points of DevOps philosophy. Sharing and collaboration are at the forefront of this movement. In a DevOps approach, you improve something (often by automating it), measure the results, and share those results with colleagues so the whole organization can improve. All of the CALMS principles are facilitated by a supportive culture.

## Accidents Are Normal

The second key idea is that accidents are not just a result of the isolated actions of an individual, but rather result from missing safeguards for when things inevitably go wrong

Therefore, it is more profitable to focus on speeding recovery than preventing accidents.

## Change Should Be Gradual

Change is risky, true, but the correct response is to split up your changes into smaller subcomponents where possible. Then you build a steady pipeline of low-risk change out of regular output from product, design, and infrastructure changes. This strategy, coupled with automatic testing of smaller changes and reliable rollback of bad changes, leads to approaches to change management like continuous integration (CI) and continuous delivery or deployment (CD).

## Tooling and Culture Are Interrelated

A good culture can work around broken tooling, but the opposite rarely holds true. As the saying goes, culture eats strategy for breakfast.

## Background on SRE

DevOps is a broad set of principles about whole-lifecycle collaboration between operations and product development. SRE is a job role, a set of practices (described next) we've found to work, and some beliefs that animate those practices. If you think of DevOps as a philosophy and an approach to working, you can argue that SRE implements some of the philosophy that DevOps describes, and is somewhat closer to a concrete definition of a job or role than, say, "DevOps engineer."

Unlike the DevOps movement, which originated from collaborations between leaders and practitioners at multiple companies, SRE at Google inherited much of its culture from the surrounding company before the term SRE became widely popularized across the industry. Given that trajectory, the discipline as a whole currently does not foreground cultural change by default quite as much as DevOps. (That doesn't imply anything about whether cultural change is necessary to do SRE in an arbitrary organization, of course.)

Operations Is a Software Problem Manage by Service Level Objectives (SLOs)

SRE does not attempt to give everything 100% availability. As discussed in our first book, Site Reliability Engineering, this is the wrong target for a number of reasons. Instead, the product team and the SRE team select an appropriate availability target for the service and its user base, and the service is managed to that SLO.

## Work to Minimize Toil

For SRE, any manual, structurally mandated operational task is abhorrent. (That doesn't mean we don't have any such operations: we have plenty of them. We just don't like them.)

For SRE in the Google context, toil is not the job—it can't be. Any time spent on operational tasks means time not spent on project work—and project work is how we make our services more reliable and scalable.

A note on "the wisdom of production": by this phrase, we mean the wisdom you get from something running in production—the messy details of how it actually behaves, and how software should actually be designed, rather than a whiteboarded view of a service isolated from the facts on the ground.

The real work in this area is determining what to automate, under what conditions, and how to automate it.

Over time, an SRE team winds up automating all that it can for a service, leaving behind things that can't be automated (the Murphy-Beyer effect). Other things being equal, this comes to dominate what an SRE team does unless other actions are taken. In the Google environment, you tend to either add more services, up to some limit that still supports 50% engineering time, or you are so successful at your automation that you can go and do something else completely different instead.

## Move Fast by Reducing the Cost of Failure

This follows from the well-known fact that the later in the product lifecycle a problem is discovered, the more expensive it is to fix.

SREs are specifically charged with improving undesirably late problem discovery, yielding benefits for the company as a whole.

## Share Ownership with Developers

In general, an SRE has particular expertise around the availability, latency, performance, efficiency, change management, monitoring, emergency response, and capacity planning of the service(s) they are looking after.

In Site Reliability Engineering, we did not make it sufficiently clear that product development teams in Google own their service by default.

## Use the Same Tooling, Regardless of Function or Job Title

Yet we share this absolute assumption with DevOps: teams minding a service should use the same tools, regardless of their role in the organization.

There is no good way to manage a service that has one tool for the SREs and another for the product developers, behaving differently (and potentially catastrophically so) in different situations. The more divergence you have, the less your company benefits from each effort to improve each individual tool.

## Compare and Contrast

Don't just allow, but actively encourage, engineers to change code and configuration when required for the product. Also allow these teams the authority to be radical within the limits of their mission, thereby eliminating incentives to proceed more slowly.

## Consider Reliability Work as a Specialized Role

At Google, SRE and product development are separate organizations. Each group has its own focus, priorities, and management, and does not have to do the bidding of the other.

## When Can Substitute for Whether

A productive relationship between SRE and product development also helps in avoiding the organizational anti-pattern in which a product development team has to ship a product or feature before it's quite ready. Instead, SRE can work with a development team to improve the product before the burden of maintenance shifts away from the people with the most expertise to fix it.

## Strive for Parity of Esteem: Career and Financial

Finally, make sure that the career incentives to do the right thing are in place: we want our DevOps/SRE organization to be held in the same esteem as their product development counterparts. Therefore, members of each team should be rated by roughly the same methods and have the same financial incentives.

## Conclusion

Given that it is a more opinionated implementation of how to perform operations, SRE has more concrete suggestions on how to change your work practices earlier on in that journey, albeit requiring specific adaptation.

DevOps, having a wider focus, is somewhat more difficult to reason about and translate into concrete steps, but precisely because of that wider focus, is likely to meet with weaker initial resistance.

# Chapter 2 - Implementing SLOs

---

## Foundations

Basic foundations of SRE include SLOs, monitoring, alerting, toil reduction, and simplicity. Getting these basics right will set you up well to succeed on your SRE journey.

## Why SREs Need SLOs

SLOs are a tool to help determine what engineering work to prioritize.

## Getting Started

There are SLOs that all stakeholders in the organization have approved as being fit for the product.

The people responsible for ensuring that the service meets its SLO have agreed that it is possible to meet this SLO under normal circumstances.

The organization has committed to using the error budget for decision making and prioritizing. This commitment is formalized in an error budget policy.

There is a process in place for refining the SLO.

## Reliability Targets and Error Budgets

An SLO sets a target level of reliability for the service's customers. Above this threshold, almost all users should be happy with your service (assuming they are otherwise happy with the utility of the service). Below this threshold, users are likely to start complaining or to stop using the service.

We keep our services reliable to keep our customers happy.

Once you have an SLO target below 100%, it needs to be owned by someone in the organization who is empowered to make tradeoffs between feature velocity and reliability. In a small organization, this may be the CTO; in larger organizations, this is normally the product owner (or product manager).

## What to Measure: Using SLIs

While many numbers can function as an SLI, we generally recommend treating the SLI as the ratio of two numbers: the number of good events divided by the total number of events.

- Number of successful HTTP requests / total HTTP requests (success rate)
- Number of gRPC calls that completed successfully in < 100 ms / total gRPC requests

Your first attempt at an SLI and SLO doesn't have to be correct; the most important goal is to get something in place and measured, and to set up a feedback loop so you can improve.

However, don't let current performance limit you as you refine your SLO:

Decide clearly who the "users" are in this situation. These are the people whose happiness you are optimizing.

Consider the common ways your users interact with your system—common tasks and critical activities.

Draw a high-level architecture diagram of your system; show the key components, the request flow, the data flow, and the critical dependencies. Group these components into categories listed in the following section (there may be some overlap and ambiguity; use your intuition and don't let perfect be the enemy of the good).

In order to capture both the typical user experience and the long tail, we also recommend using multiple grades of SLOs for some types of SLIs. For example, if 90% of users' requests return within 100 ms, but the remaining 10% take 10 seconds, many users will be unhappy. A latency SLO can capture this user base by setting multiple thresholds: 90% of requests are faster than 100 ms, and 99% of requests are faster than 400 ms. This principle applies to all SLIs with parameters that measure user unhappiness.

The proportion of records written that can be successfully read. Take particular care with durability SLIs: the data that the user wants may be only a small portion of the data that is stored. For example, if you have 1 billion records for the previous 10 years, but the user wants only the records from today (which are unavailable), then they will be unhappy

## Moving from SLI Specification to SLI Implementation

API and HTTP server availability and latency For all of the considered SLI implementations, we base the response success on the HTTP status code. 5XX responses count against SLO, while all other requests are considered successful. Our availability SLI is the proportion of successful requests, and our latency SLIs are the proportion of requests that are faster than defined thresholds.

Our example uses the load balancer monitoring, as the metrics are already available and provide SLIs that are closer to the user's experience than those from the application server's logs.

## Pipeline freshness, coverage, and correctness

When our pipeline updates the league table, it records a watermark containing the timestamp of when the data was updated.

We have a couple potential approaches to measure correctness:

- Inject data with known outputs into the system, and count the proportion of times that the output matches our expectations.

Our example bases its correctness SLI on some manually curated data in the game state database, with known good outputs that are tested every time the pipeline runs. Our SLI is the proportion of correct entries for our test data. In order for this SLI to be representative of the actual user experience, we need to make sure that our manually curated data is representative of real-world data.

## Choosing an Appropriate Time Window

Longer time periods are better for more strategic decisions: for example, if you could choose only one of three large projects, would you be better off moving to a high availability distributed database, automating your rollout and rollback procedure, or deploying a duplicate stack in another zone? You need more than a week's worth of data to evaluate large multiquarter projects; the amount of data required is roughly commensurate with the amount of engineering work being proposed to fix it.

We have found a four-week rolling window to be a good general-purpose interval. We complement this time frame with weekly summaries for task prioritization and quarterly summarized reports for project planning.

But we can also gather interesting information about the distribution. Were there any days during the past four weeks when our service did not meet its SLO? Do these days correlate with actual incidents? Was there (or should there have been) some action taken on those days in response to incidents?

The product managers have to agree that this threshold is good enough for users — performance below this value is unacceptably low and worth spending engineering time to fix.

The product developers need to agree that if the error budget has been exhausted, they will take some steps to reduce risk to users until the service is back in budget

The team responsible for the production environment who are tasked with defending this SLO have agreed that it is defensible without Herculean effort, excessive toil, and burnout—all of which are damaging to the long-term health of the team and service.

The development team gives top priority to bugs relating to reliability issues.

The development team focuses exclusively on reliability issues until the system is within SLO. This responsibility comes with high-level approval to push back on external feature requests and mandates.

## Documenting the SLO and Error Budget Policy

An appropriately defined SLO should be documented in a prominent location where other teams and stakeholders can review it. This documentation should include the following information:

The authors of the SLO, the reviewers (who checked it for technical accuracy), and the approvers (who made the business decision about whether it is the right SLO).

- The date on which it was approved, and the date when it should next be reviewed.
- A brief description of the service to give the reader context.
- The details of the SLO: the objectives and the SLI implementations.
- The details of how the error budget is calculated and consumed.
- The rationale behind the numbers, and
- How often you review an SLO document depends on the maturity of your SLO culture. When starting out, you should probably review the SLO frequently—perhaps every month.

The error budget policy should also be documented, and should include the following information:

- The policy authors, reviewers, and approvers
- The date on which it was approved, and the date when it should next be reviewed
- The actions to be taken in response to budget exhaustion
- A clear escalation path to follow if there is disagreement on the calculation or whether the agreed-upon actions are appropriate in the circumstances

Depending upon the audience's level of error budget experience and expertise, it may be beneficial to include an overview of error budgets.

## Dashboards and Reports

Error budgets can be useful for quantifying these events—for example, "this outage consumed 30% of my quarterly error budget," or "these are the top three incidents this quarter, ordered by how much error budget they consumed."

## Improving the Quality of Your SLO

Recall is the proportion of significantly user-impacting events that the SLI captures. Precision is the proportion of events captured by the SLI that were significantly user-impacting.

## Decision Making Using SLOs and Error Budgets

As already discussed, the appropriate course of action when you exhaust your error budget should be covered by the error budget policy.

Common policies include stopping feature launches until the service is once again within SLO or devoting some or all engineering time to working on reliability-related bugs.

## Advanced Topics

### Modeling User Journeys

While all of the techniques discussed in this chapter will be beneficial to your organization, ultimately SLOs should center on improving the customer experience. Therefore, you should write SLOs in terms of user-centric actions.

You can use critical user journeys to help capture the experience of your customers. A critical user journey is a sequence of tasks that is a core part of a given user's experience and an essential aspect of the service.

Once you identify user-centric events, you can solve the problem of measuring them.

### Grading Interaction Importance

Not all requests are considered equal.

### Modeling Dependencies

For example, if a single component is a critical dependency for a particularly high value interaction, its reliability guarantee should be at least as high as the reliability guarantee of the dependent action. The team that runs that particular component needs to own and manage its service's SLO in the same way as the overarching product SLO.

The probability that both services will experience an outage at the same time is so low that two zones should provide 99.9999% availability. However, this reasoning assumes that both services are wholly independent, which is almost never the case. The two instances of your app will have common dependencies, common failure domains, shared fate, and global control planes—all of which can cause an outage in both systems, no matter how carefully it is designed and managed. Unless each of these dependencies and failure patterns is carefully enumerated and accounted for, any such calculations will be deceptive.

A dependency is critical if its unavailability means that your service is also unavailable.

### Experimenting with Relaxing Your SLOs

You may want to experiment with the reliability of your application and measure which changes in reliability (e.g., adding latency into page load times) have a measurably adverse impact on user behavior (e.g., percentage of users completing a purchase).

This process may allow you to mathematically identify a relationship between a key business metric (e.g., sales) and a measurable technical metric (e.g., latency). If it does, you have gained a very valuable piece of data you can use to make important engineering decisions for your service going forward.

Error budgets are a tool for balancing reliability with other engineering work, and a great way to decide which projects will have the most impact.

# Chapter 3 - SLO Engineering Case Studies

---

We deliberately chose to bind our SLOs to a calendar month versus a rolling period to keep us focused and organized when running service reviews.

We chose to use a third-party company that specializes in building and running such probers. We selected Pingdom, but there are many others in the market. We

Frequency of probe: We poll our frontend nodes every minute.

Definition of "down": If a prober check fails, the node is marked as Unconfirmed Down and then a second geographically separate prober performs a check. If the second check fails, the node is marked down for SLO calculation purposes. The node will continue to be marked as down as long

For example, we specified how to account for maintenance windows: we could not assume that all of our hundreds of millions of users knew about our published maintenance windows. Uninformed users would therefore experience these windows as generic and unexplained downtime, so our SLO calculations treated maintenance as downtime.

We use the SLO/error budget concept as a method to allocate resources going forward. For example, if we missed the SLO for last month, that behavior helps us prioritize relevant fixes, improvements, and bug fixes. We keep it simple: teams from both Evernote and Google conduct a monthly review of SLO performance. At this meeting, we review the SLO performance from the previous month and perform a deep dive on any outages.

Based on this analysis of the past month, we set action items for improvements that may not have been captured through the regular rootcause-analysis process.

Throughout this process, our guiding principle has been "Perfect is the enemy of good." Even when SLOs aren't perfect, they're good enough to guide improvements over time.

A "perfect" SLO would be one that measures every possible user interaction with our service and accounts for all edge cases. While this is a great idea on paper, it would take many months to achieve (if achieving perfection were even possible)—time which we could use to improve the service. Instead, we selected an initial SLO that covered most, but not all, user interactions, which was a good proxy for quality of service.

In addition to our monthly Evernote/Google review of SLO performance, we've settled on a six-month SLO review cycle, which strikes the right balance between changing SLOs too often and letting them become stale.

In revising our SLOs, we've also learned that it's important to balance what you would like to measure with what's possible to measure.

The next version of SLOs will progress from our simple uptime SLO. We plan to start probing individual API calls and accounting for the in-client view of metrics/performance so we can represent user QoS even better.

## The Home Depot's SLO Story

"freedom and responsibility culture" of full-stack ownership. This approach gives developers freedom to push code when they want, but also makes them jointly responsible for the operations of their service.

How do you handle overload?

Our efforts spanned four general areas:

- Common vernacular - Define SLOs in the context of THD. Define how to measure them in a consistent way.
- Evangelism - Spread the word across the company.
  - Create training material to sell why SLOs matter, road shows across the company, internal blogs, and promotional materials like t-shirts and stickers.
  - Enlist a few early adopters to implement SLOs and demonstrate the value to others.
  - Establish a catchy acronym (VALET; as discussed later) to help the idea spread.
- Create a training program (FiRE Academy: Fundamentals in Reliability Engineering) train developers on SLOs and other reliability concepts.
- Incentive - Establish annual goals for all development managers to set and measure SLOs for their services.

Every service monitored some form of its traffic volume, latency, errors, and utilization—metrics that map closely to Google SRE's Four Golden Signals.

Training options range from a one-hour primer to half-day workshops to intense four-week immersion with a mature SRE team, complete with a graduation ceremony and a FiRE badge.

## Availability and latency for API calls

### Infrastructure utilization

We decided against setting utilization SLOs for a few reasons. To begin with, microservices aren't overly concerned with this metric—your users don't really care about utilization as long as you can handle the traffic volume, your microservice is up, it's responding quickly, it's not throwing errors, and you're not in danger of running out of capacity.

### Traffic volume

Traffic was easy to define as requests to a service, but we needed to decide if we should track average requests per second, peak requests per second, or the volume of requests over the reporting time period.

### Latency

At minimum, services needed to hit a 90th percentile target; user-facing services had a preferred target of 95th and/or 99th percentile.

After much deliberation, we decided to track both 4xx and 5xx errors, but used 5xx errors only to set SLOs.

As we needed to secure executive backing for our move to SLOs, our education campaign started with senior leadership. We then met with development teams one by one to espouse the values of SLOs.

We eventually also included metrics from a variety of other monitoring systems such as Stackdriver's probe for availability.

These reports became the foundation for a new best practice with developers: regular SLO reviews of their services (typically, either weekly or monthly). Based upon these reviews, developers can create action items to return a service to its SLO, or perhaps decide that an unrealistic SLO needs to be adjusted.

With a little adjusting, batch applications can fit into this framework as follows: Volume The volume of records processed Availability How often (as a percentage) the job completed by a certain time Latency The amount of time it takes for the job to run Errors The records that failed to process Tickets The number of times an operator has to manually fix data and reprocess a job

Currently, even if a particular service has multiple endpoints, we track VALET only across the entire service. As a result, it's difficult to distinguish between different operations (for example, a write to the catalog versus a read to the catalog; while we monitor and alert on these operations separately, we don't track SLOs).

Although we currently track latency SLOs at the web-serving layer, we'd also like to track a latency SLO for end users. This measurement would capture how factors like third-party tags, internet latency, and CDN caching affect how long it takes a page to start rendering and to complete rendering.

We'd also like to extend VALET data to application deployments. Specifically, we'd like to use automation to verify that VALET is within tolerance before rolling out a change to the next server, zone, or region.

Finally, we strongly believe that the SLOs for a service should be set by the business owner of the service (often called a product manager) based on its criticality to the business. At the very least, we want the business owners to set the requirement for a service's uptime and use that SLO as a shared objective between product management and development.

- 99.5%: Applications that are not used by store associates or an MVP of a new service
- 99.9%: Adequate for the majority of nonselling systems at THD
- 99.95%: Selling systems (or services that support selling systems)
- 99.99%: Shared infrastructure services

# Chapter 4 - Monitoring

---

## Desirable Features of a Monitoring Strategy

### Calculations

A monitoring system that supports computing percentiles (i.e., 50th, 95th, 99th percentiles) when recording latency will let you see if 50%, 5%, or 1% of your requests are too slow, whereas the arithmetic mean can only tell you—without specifics—that the request time is slower.

### Sources of Monitoring Data

If you're alerting based on metrics, it might be tempting to add more alerting based on logs—for example, if you need to be notified when even a single exceptional event happens. We still recommend metrics-based alerting in such cases: you can increment a counter metric when a particular event happens, and configure an alert based on that metric's value. This strategy keeps all alert configuration in one place, making it easier to manage (see "Managing Your Monitoring System" on page 67).

## Managing Your Monitoring System

### Treat Your Configuration as Code

Treating system configuration as code and storing it in the revision control system are common practices that provide some obvious benefits: change history, links from specific changes to your task tracking system, easier rollbacks and linting checks,1 and enforced code review procedures. We strongly recommend also treating monitoring configuration as code (for more on configuration, see Chapter 14).

### Encourage Consistency

The right solution depends on your organization. Google's approach has evolved over time toward convergence on a single framework run centrally as a service. This solution works well for us for a few reasons. A single framework enables engineers to ramp up faster when they switch teams, and makes collaboration during debugging easier. We also have a centralized dashboarding service, where each team's dashboards are discoverable and accessible. If you easily understand another team's dashboard, you can debug both your issues and theirs more quickly.

If possible, make basic monitoring coverage effortless. If all your services export a consistent set of basic metrics, you can automatically collect those metrics across your entire organization and provide a consistent set of dashboards. This approach means that any new component you launch automatically has basic monitoring. Many teams across your company—even nonengineering teams—can use this monitoring data.

## Metrics with Purpose

- Add monitoring that informs you of any changes in production.
- Monitor the version of the binary.
- Monitor the command-line flags, especially when you use these flags to enable and disable features of the service.
- If configuration data is pushed to your service dynamically, monitor the version of this dynamic configuration.

When you're trying to correlate an outage with a rollout, it's much easier to look at a graph/dashboard linked from your alert than to trawl through your CI/CD (continuous integration/continuous delivery) system logs after the fact.

## Status of Served Traffic

For HTTP traffic, monitor all response codes, even if they don't provide enough signal for alerting, because some can be triggered by incorrect client behavior.

If you apply rate limits or quota limits to your users, monitor aggregates of how many requests were denied due to lack of quota.

## Implementing Purposeful Metrics

When you write a postmortem, think about which additional metrics would have allowed you to diagnose the issue faster.

## Testing Alerting Logic

Binary reporting: Check that the exported metric variables change in value under certain conditions as expected.

Monitoring configurations: Make sure that rule evaluation produces expected results, and that specific conditions produce the expected alerts.

Alerting configurations: Test that generated alerts are routed to a predetermined destination, based on alert label values.

If you can't test your monitoring via synthetic means, or there's a stage of your monitoring you simply can't test, consider creating a running system that exports wellknown metrics, like number of requests and errors. You can use this system to validate derived time series and alerts. It's very likely that your alerting rules will not fire for months or years after you configure them, and you need to have confidence that when the metric passes a certain threshold, the correct engineers will be alerted with notifications that make sense.

# Chapter 5 - Alerting on SLOs

---

We believe that having good SLOs that measure the reliability of your platform, as experienced by your customers, provides the highest-quality indication for when an on-call engineer should respond.

## Alerting Considerations

### Precision

The proportion of events detected that were significant. Precision is 100% if every alert corresponds to a significant event. Note that alerting can become particularly sensitive to nonsignificant events during low-traffic periods

### Recall

The proportion of significant events detected. Recall is 100% if every significant event results in an alert.

### Detection time

How long it takes to send notifications in various conditions. Long detection times can negatively impact the error budget.

### Reset time

How long alerts fire after an issue is resolved. Long reset times can lead to confusion or to issues being ignored.

## Ways to Alert on Significant Events

We recommend 2% budget consumption in one hour and 5% budget consumption in six hours as reasonable starting numbers for paging,

## Multiwindow, Multi-Burn-Rate Alerts

We can enhance the multi-burn-rate alerts in iteration 5 to notify us only when we're still actively burning through the budget—thereby reducing the number of false positives. To do this, we need to add another parameter: a shorter window to check if the error budget is still being consumed as we trigger the alert.

A good guideline is to make the short window 1/12 the duration of the long window, as shown in Figure 5-6. The graph shows both alerting threshold. After experiencing 15% errors for 10 minutes, the short window average goes over the alerting threshold immediately, and the long window average goes over the threshold after 5 minutes, at which point the alert starts firing. The short window average drops below the threshold 5 minutes after the errors stop, at which point the alert stops firing. The long window average drops below the threshold 60 minutes after the errors stop.

- Page 1 hour 5 minutes 14.4 2%
- Page 6 hours 30 minutes 6 5%
- Ticket 3 days 6 hours 1 10%

We have found that alerting based on multiple burn rates is a powerful way to implement SLO-based alerting.

## Low-Traffic Services and Error Budget Alerting

The multiwindow, multi-burn-rate approach just detailed works well when a sufficiently high rate of incoming requests provides a meaningful signal when an issue arises. However, these approaches can cause problems for systems that receive a low rate of requests. If a system has either a low number of users or natural low-traffic periods (such as nights and weekends), you may need to alter your approach.

It's harder to automatically distinguish unimportant events in low-traffic services. For example, if a system receives 10 requests per hour, then a single failed request results in an hourly error rate of 10%. For a 99.9% SLO, this request constitutes a 1,000x burn rate and would page immediately, as it consumed 13.9% of the 30-day error budget.

We recommend a few key options to handle a low-traffic service:

Generate artificial traffic to compensate for the lack of signal from real users.

Combine smaller services into a larger service for monitoring purposes.

Modify the product so that either: — It takes more requests to qualify a single incident as a failure. — The impact of a single failure is lower.

## Generating Artificial Traffic

Artificial traffic provides more signals to work with, and allows you to reuse your existing monitoring logic and SLO values. You may even already have most of the necessary traffic-generating components, such as black-box probers and integration tests.

Generating artificial load does have some downsides. Most services that warrant SRE support are complex, and have a large system control surface. Ideally, the system should be designed and built for monitoring using artificial traffic. Even for a nontrivial service, you can synthesize only a small portion of the total number of user request types. For a stateful service, the greater number of states exacerbates this problem.

## Combining Services

A downside to combining services is that a complete failure of an individual service may not count as a significant event. You can increase the likelihood that a failure will affect the group as a whole by choosing services with a shared failure domain, such as a common backend database. You can still use longer-period alerts that eventually catch these 100% failures for individual services.

## Making Service and Infrastructure Changes

Modify the client to retry, with exponential backoff and jitter

Set up fallback paths that capture the request for eventual execution, which can take place on the server or on the client.

## Lowering the SLO or Increasing the Window

You might also want to reconsider if the impact of a single failure on the error budget accurately reflects its impact on users.

If a small number of errors causes you to lose error budget, do you really need to page an engineer to fix the issue immediately? If not, users would be equally happy with a lower SLO. With a lower SLO, an engineer is notified only of a larger sustained outage.

Lowering the SLO does have a downside: it involves a product decision. Changing the SLO affects other aspects of the system, such as expectations around system behavior and when to enact the error budget policy.

## Extreme Availability Goals

For example, consider a service that has a 90% availability target. Table 5-8 says to page when 2% of the error budget in a single hour is consumed.

Because a 100% outage consumes only 1.4% of the budget in that hour, this alert could never fire. If your error budgets are set over long time periods, you may need to tune your alerting parameters.

Receiving notifications that you have only 26 seconds of budget left isn't necessarily a bad strategy; it's just not useful for defending the SLO. The only way to defend this level of reliability is to design the system so that the chance of a 100% outage is extremely low. That way, you can fix issues before consuming the budget. For example, if you initially roll out that change to only 1% of your users, and burn your error budget at the same rate of 1%, you now have 43 minutes before you exhaust your error budget. See Chapter 16 for tactics on designing such a system.

## Alerting at Scale

### CRITICAL

For request types that are the most important, such as a request when a user logs in to the service.

### HIGH_FAST

For requests with high availability and low latency requirements. These requests involve core interactive functionality, such as when a user clicks a button to see how much money their advertising inventory has made this month.

### HIGH_SLOW

For important but less latency-sensitive functionality, such as when a user clicks a button to generate a report of all advertising campaigns over the past few years, and does not expect the data to return instantly.

### LOW

For requests that must have some availability, but for which outages are mostly invisible to users—for example, polling handlers for account notifications that can fail for long periods of time with no user impact.

### NO_SLO

For functionality that is completely invisible to the user—for example, dark launches or alpha functionality that is explicitly outside of any SLO.

By grouping requests rather than placing unique availability and latency objectives on all request types, you can group requests into five buckets,

CRITICAL 99.99% 100 ms 200 ms
HIGH_FAST 99.9% 100 ms 200 ms
HIGH_SLOW 99.9% 1,000 ms 5,000 ms
LOW 99% None None
NO_SLO None None None

These buckets provide sufficient fidelity for protecting user happiness, but entail less toil than a system that is more complicated and expensive to manage that probably maps more precisely to the user experience.

## Conclusion

If you set SLOs that are meaningful, understood, and represented in metrics, you can configure alerting to notify an on-caller only when there are actionable, specific threats to the error budget.

The techniques for alerting on significant events range from alerting when your error rate goes above your SLO threshold to using multiple levels of burn rate and window sizes. In most cases, we believe that the multiwindow, multi-burn-rate alerting technique is the most appropriate approach to defending your application's SLOs.

# Chapter 6 - Eliminating Toil

---

## What Is Toil?

### Manual

When the tmp directory on a web server reaches 95% utilization, engineer Anne logs in to the server and scours the filesystem for extraneous log files to delete.

### Repetitive

A full tmp directory is unlikely to be a one-time event, so the task of fixing it is repetitive.

### Automatable

It would be even better to fully automate the problem detection and remediation by not requiring a human to run the script. Better still, submit a patch so that the software no longer breaks in this way.

### Nontactical/reactive

When you receive too many alerts along the lines of "disk full" and "server down," they distract engineers from higher-value engineering and potentially mask other, higher-severity alerts. As a result, the health of the service suffers.

- Lacks enduring value
- Grows at least as fast as its source

In addition to the preceding traits, consider the effect a particular piece of work has on team morale. Do people enjoy doing a task and find it rewarding, or is it the type of work that's often neglected because it's viewed as boring or unrewarding?

Reducing toil is an acknowledgment that an engineer's effort is better utilized in areas where human judgment and expression are possible.

## Measuring Toil

Before beginning toil reduction projects, it's important to analyze cost versus benefit and to confirm that the time saved through eliminating toil will (at minimum) be proportional to the time invested in first developing and then maintaining an automated solution (Figure 6-1).

Potential benefits could include:

- Growth in engineering project work over time, some of which will further reduce toil
- Increased team morale and decreased team attrition and burnout
- Less context switching for interrupts, which raises team productivity
- Increased process clarity and standardization
- Enhanced technical skills and career growth for team members
- Reduced training time
- Fewer outages attributable to human errors
- Improved security
- Shorter response times for user requests

So how do we recommend you measure toil?

Identify it.

Select an appropriate unit of measure that expresses the amount of human effort applied to this toil.

Minutes and hours are a natural choice because they are objective and universally understood.

As long as the unit is objective, consistent, and well understood, it can serve as a measurement of toil.

Track these measurements continuously before, during, and after toil reduction efforts. Streamline the measurement process using tools or scripts so that collecting these measurements doesn't create additional toil!

## Toil Taxonomy

### Business Processes

Ticket toil is a bit insidious because ticket-driven business processes usually accomplish their goal. Users get what they want, and because the toil is typically dispersed evenly across the team, the toil doesn't loudly and obviously call for remediation. Wherever a ticket-driven process exists, there's a chance that toil is quietly accumulating nearby.

### Production Interrupts

### Release Shepherding

### Migrations

Technically, modifying backup tooling for one database to work with another is software development, but this work is basically just refactoring code to replace one interface with another. This work is repetitive, and to a large extent, the business value of the backup tooling is the same as before.

## Cost Engineering and Capacity Planning

Whether you own hardware or use an infrastructure provider (cloud), cost engineering and capacity planning usually entail some associated toil.

Ensuring a cost-effective baseline or burstable capability for future needs

Preparing for (and recovering from) critical high-traffic events like a product launch or holiday.

## Troubleshooting for Opaque Architectures

Troubleshooting itself isn't inherently bad, but you should aim to focus your energy on novel failure modes—not the same type of failure every week caused by brittle system architecture.

## Toil Management Strategies

### Identify and Measure Toil

If your team is experiencing toil overload, treat toil reduction as its own project. Google SRE teams often track toil in bugs and rank toil according to the cost to fix it and the time saved by doing so. See the section "Measuring Toil" on page 96 for techniques and guidance.

### Engineer Toil Out of the System

A team that runs a system in production has invaluable experience with how that system works. They know the quirks and tedious bits that cause the most amount of toil. An SRE team should apply this knowledge by working with product development teams to develop operationally friendly software that is not only less toilsome, but also more scalable, secure, and resilient.

### Reject the Toil

For a given set of toil, analyze the cost of responding to the toil versus not doing so. Another tactic is to intentionally delay the toil so that tasks accumulate for batch or parallelized processing. Working with toil in larger aggregates reduces interrupts and helps you identify patterns of toil, which you can then target for elimination.

### Start with Human-Backed Interfaces

If you have a particularly complex business problem with many edge cases or types of requests, consider a partially automated approach as an interim step toward full automation.

### Provide Self-Service Methods

You can provide a web form, binary or script, API, or even just documentation that tells users how to issue pull requests to your service's configuration files. For example, rather than asking engineers to file a ticket to provision a new virtual machine for their development work, give them a simple web form or script that triggers the provisioning. Allow the script to gracefully degrade to a ticket for specialized requests or if a failure occurs.

### Get Support from Management and Colleagues

It is important for everyone in the organization to agree that toil reduction is a worthwhile goal. Manager support is crucial in defending staff from new demands. Use objective metrics about toil to make the case for pushback.

To create strong business cases for toil reduction, look for opportunities to couple your strategy with other desirable features or business goals. If a complementary goal —for example, security, scalability, or reliability—is compelling to your customers, they'll be more willing to give up their current toil-generating systems for shiny new ones that aren't as toil intentive. Then, reducing toil is just a nice side effect of helping users!

### Start Small and Then Improve

Pick clear metrics such as MTTR (Mean Time to Repair) to measure your success.

### Increase Uniformity

Teams are free to choose their own approaches, but they have to own the toil generated by unsupported tools or legacy systems.

### Automate Toil Response

Once your process is thoroughly documented, try to break down the manual work into components that can be implemented separately and used to create a composable software library that other automation projects can reuse later.

### Avoidance

Avoidance is effectively choosing to accept technical debt and to move away from SRE principles and toward system administration.

### Encapsulation/augmentation

You can bring SREs on board to build a shell of abstracted APIs, automation, configuration management, monitoring, and testing around these legacy systems that will offload work from SAs.

This tactic is still avoidance, but is a bit like refinancing high-interest technical debt into low-interest technical debt. It's usually a stopgap measure to prepare for an incremental replacement.

### Replacement/refactoring

It's best undertaken incrementally.

### Retirement/custodial ownership

To align business incentives, stragglers who haven't migrated can assume custodial ownership of remnants of the legacy system.

## Case Studies

Reached a point at which it could no longer scale sublinearly with human effort; over time, an increasing number of engineer hours resulted in smaller returns on that investment.

It demonstrates that with a little persistence and perseverance, it's possible to move to alternatives even when constrained by the institutional inertia of a large organization.

The first step to retiring a legacy system is to stop or (often more realistically) to slow or discourage new adoption. It's much more painful to take something away from users than never offer it in the first place.

Automation craves conformity.

## Conclusion

At minimum, the amount of toil associated with running a production service grows linearly with its complexity and scale. Automation is often the gold standard of toil elimination, and can be combined with a number of other tactics. Even when toil isn't worth the effort of full automation, you can decrease engineering and operations workloads through strategies like partial automation or changing business processes.

Eliminating toil frees up engineering time to focus on the more enduring aspects of services, and allows teams to keep manual tasks at a minimum as the complexity and scale of modern service architectures continue to increase.

Toil usually starts small, and can rapidly grow to consume an entire team. SRE teams must be relentless in eliminating toil, because even if the task seems daunting, the benefits usually exceed the costs.

We hope these stories encourage you to identify your toil, quantify it, and then work toward eliminating it. Even if you can't invest in a big project today, you can start with a small proof of concept that can help change your team's willingness to deal with toil.

# Chapter 7 - Simplicity

A complex system that works is invariably found to have evolved from a simple system that worked. — Gall's Law

Simplicity is an important goal for SREs, as it strongly correlates with reliability: simple software breaks less often and is easier and faster to fix when it does break. Simple systems are easier to understand, easier to maintain, and easier to test.

## Measuring Complexity

Measuring the complexity of software systems is not an absolute science. There are a number of ways to measure software code complexity, most of which are quite objective. Perhaps the best-known and most widely available standard is cyclomatic code complexity, which measures the number of distinct code paths through a specific set of statements.

For example, a block of code with no loops or conditionals has a cyclomatic complexity number (CCN) of 1.

We're less adept at understanding whether the resulting measured complexity is necessary or accidental, how the complexity of one method might influence a larger system, and which approaches are best for refactoring.

### Training time

How long does it take a new team member to go on-call?

### Diversity of deployed configurations

How many unique configurations are deployed in production (including binaries, binary versions, flags, and environments)?

### Age

How old is the system?

Hyrum's Law states that over time, the users of an API depend on every aspect of its implementation, resulting in fragile and unpredictable behaviors.

## Simplicity Is End-to-End, and SREs Are Good for That

Generally, production systems are not designed in a holistic fashion; rather, they grow organically. They accumulate components and connections over time as teams add new features and launch new products. While a single change might be relatively simple, every change impacts the components around it. Therefore, overall complexity can quickly become overwhelming. For example, adding retries in one component might overload a database and destabilize the whole system, or make it harder to reason about the path a given query follows through the system.

Frequently, the cost of complexity does not directly affect the individual, team, or role that introduces it—in economic terms, complexity is an externality.

Instead, complexity impacts those who continue to work in and around it. Thus, it is important to have a champion for end-to-end system simplicity.

SREs are a natural fit for this role because their work requires them to treat the system as a whole.

In addition to supporting their own services, SREs must also have insight into the systems their service interacts with. Google's product development teams often don't have visibility on production-wide issues, so they find it valuable to consult SREs for advice on the design and operation of their systems.

Before an engineer goes on-call for the first time, encourage them to draw (and redraw) system diagrams. Keep a canonical set of diagrams in your documentation: they're useful to new engineers and help more experienced engineers keep up with changes.

In our experience, product developers usually end up working in a narrow subsystem or component. As a result, they don't have a mental model for the overall system, and their teams don't create system-level architecture diagrams.

These diagrams are useful because they help team members visualize system interactions and articulate issues using a common vocabulary.

More often than not, we find the SRE team for the service draws the system-level architecture diagrams.

Ensure that an SRE reviews all major design docs, and that the team documents show how the new design affects the system architecture. If a design adds complexity, the SRE might be able to suggest alternatives that simplify the system.

## Case Study 1: End-to-End API Simplicity

Don't compare the expected result to your current system.

Instead, compare the expected result to what your current system would look like if you invested the same effort in

improving it. Sometimes a rewrite is the best way forward, but make sure you've weighed the costs and benefits and that you don't underestimate the costs.

Whatever the work, leadership must ensure that simplification efforts are celebrated and explicitly prioritized.

Simplification is efficiency—instead of saving compute or network resources, it saves engineering time and cognitive load.

Treat successful simplification projects just as you treat useful feature launches, and measure and celebrate code addition and removal equally.

For example, Google's intranet displays a "Zombie Code Slayer" badge for engineers that delete significant amounts of code.

Simplification is a feature. You need to prioritize and staff simplification projects and reserve time for SREs to work on them.

If product developers and SREs do not see simplification projects as beneficial to their careers, they won't undertake these projects. Consider making simplicity an explicit goal for particularly complex systems or overloaded teams. Create a separate bucket of time to do this work. For example, reserve 10% of engineering project time for "simplicity" projects
Note - Location 2331
Could also be interpreted as 1/10 sprints.

Have engineers brainstorm known complexities in the system and discuss ideas to reduce them.

As previously mentioned, the act of diagramming your system can help you identify deeper design problems that hinder your ability to understand the system and predict its behavior. For example, when diagramming your system, you might look for the following:

### Amplification

As Dijkstra said, "If we wish to count lines of code, we should not regard them as 'lines produced' but as 'lines spent.'"

Ads serving SREs were the natural drivers for standardization: while each component had a specific developer team, SREs were on-call for the entire stack.

## Case Study 4: Running Hundreds of Microservices on a Shared Platform

### Background

Over the past 15 years, Google has developed multiple successful product verticals (Search, Ads, and Gmail, to name a few) and produced a steady stream of new and refactored systems.

Many of these systems have a dedicated SRE team and a corresponding domain-specific production stack that includes a bespoke development workflow, continuous integration and continuous delivery (CI/CD) software cycles, and monitoring.

These unique production stacks incur significant overhead in terms of maintenance, development costs, and independent SRE engagement. They also make it harder to move services (or engineers!) between teams, or to add new services.

### What we decided to do

A set of SRE teams in the social networking space worked to converge the production stacks for their services into a single managed microservices platform, managed by a single group of SREs.

The shared platform is compliant with best practices, and it bundles and automatically configures many previously underused features that improve reliability and facilitate debugging.

Regardless of their SRE engagement level, new services within the scope of the SRE team were required to use the common platform, and legacy services had to either migrate to the new platform or be phased out.

After its success in the social network space, the shared platform is gaining adoption with other SRE and non-SRE teams across Google.

### Design

We used microservices so we could quickly update and deploy features—a single monolithic service changes slowly.

Services are managed, not hosted: rather than removing control and responsibility from individual teams, we empower them to manage their services effectively themselves. We provide workflow tools that service teams can use to release, monitor, and more.

The tools we provide include a UI, API, and a command-line interface that SREs and developers use to interact with their stack. The tools make the developer experience feel unified, even when it involves many underlying systems.

### Outcomes

The platform's high quality and feature set had an unexpected benefit: developer teams can run hundreds of services without any deep SRE engagement.

The common platform also changed the SRE-developer relationship. As a result, tiered SRE engagement is becoming common at Google.

Tiered engagement includes a spectrum of SRE involvement, ranging from light consulting and design reviews to deep engagement (i.e., SREs share on-call duties).

### Lessons learned

Shifting from sparse or ill-defined standards to a highly standardized platform is a long-term investment. Each step might feel incremental, but ultimately, these steps reduce overhead and make running services at scale possible.

It's important that developers see the value in such a transition. Aim for incremental productivity wins that are unlocked at each stage of development. Don't try to convince people to perform a huge refactor that pays off only at the very end.

Simplicity is a natural goal for SREs because simple systems tend to be reliable and easy to run. It's not easy to quantitatively measure simplicity (or its inverse, complexity) for distributed systems, but there are reasonable proxies, and it's worth picking some and working to improve them.

Because of their end-to-end understanding of a system, SREs are in an excellent position to identify, prevent, and fix sources of complexity, whether they are found in software design, system architecture, configuration, deployment processes, or elsewhere.

SREs should be involved in design discussions early on to provide their unique perspective about the costs and benefits of alternatives, with a particular eye toward simplicity. SREs can also proactively develop standards to homogenize production.

As an SRE, pushing for simplicity is an important part of your job description. We strongly recommend that SRE leadership empower SRE teams to push for simplicity, and to explicitly reward these efforts. Systems inevitably creep toward complexity as they evolve, so the fight for simplicity requires continuous attention and commitment—but it is very much worth pursuing.

# Part II - Practices

## Defining Operational Work (Versus Project Work and Overhead)

SRE practices apply software engineering solutions to operational problems.

While engineering and operational work do inform each other, we can conceptualize the work any given SRE team performs as two separate categories, as shown in Figure II-1.

We can break down operational work into four general categories:

- On-call work
- Customer requests (most commonly, tickets)
- Incident response
- Postmortems

When a team's interrupt work is well managed, they have time for longer-term engineering work to achieve stability, reliability, and availability goals.

Also shown in Figure II-1, overhead is the administrivia necessary to working at a company: meetings, training, responding to emails, tracking your accomplishments, filling out paperwork, and so on. Overhead isn't immediately important to the discussion at hand, but all team members spend time on it.

While every team and organization needs to find its own healthy balance, we've found that about one-third of time spent on operational tasks and two-thirds of time spent on project work is just about right (this ratio also informs an ideal on-call rotation size, where your engineers are only on-call one-third of the time).

At Google, we conduct regular Production Excellence (ProdEx) Reviews, which allow senior SRE leadership a view into the state of every SRE team using a clearly defined rubric. You'll need to determine the appropriate time intervals and rubric according to your own constraints and organizational maturity, but the key here is to generate metrics about team health that you can track over time.

Remember one caveat when finding your ideal balance: a team that spends too little of its time on operational tasks risks operational underload. In this situation, engineers might start to forget crucial aspects of the service they are responsible for. You can counter operational underload by taking more risks and moving faster—for example, shorten your release cycles, push more features per release, or perform more disaster recovery testing.

If your team is perpetually underloaded, consider onboarding related services or handing back a service that no longer needs SRE support to the development team (for more discussion of team size, see Chapter 8).

# Chapter 8 - On-Call

---

## Recap of "Being On-Call" Chapter of First SRE Book

At Google, the overall goal of being on-call is to provide coverage for critical services, while making sure that we never achieve reliability at the expense of an on-call engineer's health.

To put this in perspective, most SRE teams at Google do not expect new hires to be ready for on-call before three to nine months.

One "incident" is defined as one "problem," no matter how many alerts have been fired for the same "problem." One shift is 12 hours.

## Example On-Call Setups Within Google and Outside Google

### Training roadmap

As the four Nooglers completed company orientation, Sara and Mike compiled a checklist of two dozen focus areas for people to practice before going on-call, such as:

- Administering production jobs
- Understanding debugging info
- "Draining" traffic away from a cluster
- Rolling back a bad software push
- Blocking or rate-limiting unwanted traffic
- Bringing up additional serving capacity
- Using the monitoring systems (for alerting and dashboards)
- Describing the architecture, various components, and dependencies of the services

A London SRE put together a thorough set of disaster scenarios and ran them during Google's disaster recovery training week (see the section "Preparedness and Disaster Testing" in Site Reliability Engineering, Chapter 33).

The team also practiced being on-call through "Wheel of Misfortune" training exercises (see the section "Disaster Role Playing" in Site Reliability Engineering, Chapter 28), where they role-played recent incidents to practice debugging production problems.

Before going on-call, the team reviewed precise guidelines about the responsibilities of on-call engineers. For example: • At the start of each shift, the on-call engineer reads the handoff from the previous shift.

The on-call engineer minimizes user impact first, then makes sure the issues are fully addressed.

At the end of the shift, the on-call engineer sends a handoff email to the next engineer on-call.

The guidelines also specified when to escalate to others, and how to write postmortems for large incidents.

Finally, the team read and updated on-call playbooks. Playbooks contain high-level instructions on how to respond to automated alerts. They explain the severity and impact of the alert, and include debugging suggestions and possible actions to take to mitigate impact and fully resolve the alert. In SRE, whenever an alert is created, a corresponding playbook entry is usually created. These guides reduce stress, the mean time to repair (MTTR), and the risk of human error.

## Maintaining Playbooks

For example, they may have just one entry for all "RPC Errors High" alerts, for a trained on-call engineer to read, in conjunction with an architecture diagram for the currently alerting service. Other SREs advocate for step-by-step playbooks to reduce human variability and drive down MTTR.

If your playbooks are a deterministic list of commands that the on-call engineer runs every time a particular alert fires, we recommend implementing automation.

The previous investment by Mountain View SREs in developing onboarding and training materials helped the new Zürich SRE team ramp up.

While the approach used by the Mountain View SREs made sense when a cohort of SREs were becoming a team, they needed a more lightweight approach when only one person joined the team at a given time. In anticipation of future turnover, the SREs created service architecture diagrams and formalized the basic training checklist into a series of exercises that could be completed semi-independently with minimal involvement from a mentor. These exercises included describing the storage layer, performing capacity increases, and reviewing how HTTP requests are routed.

## Restructuring our monitoring and metrics

We classify any event generated by our metrics or monitoring infrastructure into three categories:

### P1: Deal with immediately

- Should be immediately actionable
- Pages the on-call
- Leads to event triage
- Is SLO-impacting

### P2: Deal with the next business day

- Generally is not customer-facing, or is very limited in scope
- Sends an email to team and notifies event stream channel

### P3: Event is informational only

- Information is gathered in dashboards, passive email, and the like
- Includes capacity planning–related information

Any P1 or P2 event has an incident ticket attached to it. The ticket is used for obvious tasks like event triage and tracking remediation actions, as well as for SLO impact, number of occurrences, and postmortem doc links, where applicable.

Once the event is escalated, we assemble an incident team and begin our incident management process. The incident manager is paged, a scribe and communications lead is elected, and our communication channels open.

After the incident is resolved, we conduct an automatic postmortem and share the results far and wide within the company. For events rating Sev 2 or Sev 3, the on-call responder handles the incident lifecycle, including an abbreviated postmortem for incident review.

One of the benefits of keeping our process lightweight is that we can explicitly free the on-call from any expectations of project work. This empowers and encourages the on-call to take immediate follow-up action, and also to identify any major gaps in tooling or process after completing the post-incident review. In this way, we achieve a constant cycle of improvement and flexibility during every on-call shift, keeping pace with the rapid rate of change in our environment.

The goal is to make every on-call shift better than the last.

## Tracking our performance over time

With the introduction of SLOs, we wanted to track performance over time, and share that information with stakeholders within the company. We implemented a monthly service review meeting, open to anyone who's interested, to review and discuss the previous month of the service.

We have also used this forum to review our on-call burden as a barometer of team health, and discuss remediation actions when we exceed our pager budget.

This forum has the dual purpose of spreading the importance of SLOs within the company and keeping the technical organization accountable for maintaining the health and wellness of our service and team.

## Practical Implementation Details

An incident may involve more than one page.

### Anatomy of Pager Load

We recommend checking your current paging setup to see if you actually should be paged for everything that currently triggers a page.

They had an established pager budget of two paging incidents per shift,

The first step in tackling high pager load is to determine what is causing it. Pager load is influenced by three main factors: bugs in production, alerting, and human processes.

### New bugs

When a production system is plagued by several concurrent bugs, it's much more difficult to identify if a given page is for an existing or new bug.

### Mitigation delay

If you aim for 99.99% availability, you have approximately 15 minutes of error budget per quarter. The build step of rolling forward may take much longer than 15 minutes, so rolling back impacts your users much less.

If at all possible, avoid changes that can't be rolled back, such as API incompatible changes and lockstep releases.

Design your system so that if feature X goes wrong, you can disable it via, for example, a feature flag without affecting feature Y. This strategy also improves release velocity, and makes disabling feature X a much simpler decision—you don't need to check that your product managers are comfortable with also disabling feature Y.

For example, if the bug is the result of a code or config rollout, and you roll out to production gradually, you may have the opportunity to drain the elements of your infrastructure that have received the update. This allows you to mitigate the customer impact in seconds, rather than rolling back, which may take minutes or longer.

### Alerting

Google SRE's maximum of two distinct incidents per 12-hour shift encourages us to be thoughtful and cautious about how we configure paging alerts and how we introduce new ones.

All alerts should be immediately actionable. There should be an action we expect a human to take immediately after they receive the page that the system is unable to take itself.

If a team fully subscribes to SLO-based alerting, or paging only when error budget is burned (see the section "Black-Box Versus White-Box" in Site Reliability Engineering), it is critical that all teams involved in developing and maintaining the service agree about the importance of meeting the SLO and prioritize their work accordingly.

Just like new code, new alerts should be thoroughly and thoughtfully reviewed. Each alert should have a corresponding playbook entry.

Receiving a page creates a negative psychological impact. To minimize that impact, only introduce new paging alerts when you really need them. Anyone on the team can write a new alert, but the whole team reviews proposed alert additions and can suggest alternatives. Thoroughly test new alerts in production to vet false positives before they are upgraded to paging alerts. For example, you might email the alert's author when the alert fires, rather than paging the on-call engineer.

### Rigor of follow-up

If you know the root cause, you can fix and prevent it from ever bothering you or your colleagues again. If your team cannot figure out the root cause, add monitoring and/or logging that will help you find the root cause of the page the next time it occurs.

Explaining away a page as "transient," or taking no action because the system "fixed itself" or the bug inexplicably "went away," invites the bug to happen again and cause another page, which causes trouble for the next on-call engineer.

If your proposal will take 3 working weeks or 120 working hours to implement, and a page costs on average 4 working hours to properly handle, there's a clear break-even point after 30 pages.

For example, imagine a situation where there are too many servers on the same failure domain, such as a switch in a datacenter, causing regular multiple simultaneous failures:

**Point fix**

Rebalance your current footprint across more failure domains and stop there.

**Systemic fix**

Use automation to ensure that this type of server, and all other similar servers, are always spread across sufficient failure domains, and that they rebalance automatically when necessary.

**Monitoring (or prevention) fix**

Alert preemptively when the failure domain diversity is below the expected level, but not yet service-impacting. Ideally, the alert would be a ticket alert, not a page, since it doesn't require an immediate response. The system is still serving happily, albeit at a lower level of redundancy.

For example, a Google on-caller typically doesn't work on projects during their on-call shift. Instead, they work on bugs that improve the health of the system. Make sure that your team routinely prioritizes production bugs above other project work. SRE managers and tech leads should make sure that production bugs are promptly dealt with, and escalate to the developer team decision makers when necessary.

## Which bugs cause the most pages?

You can automatically prioritize fixing bugs based on the number of pages each bug causes.

No one wants to be paged for the same issue that paged their teammate in the previous shift.

At production meetings (see the section "Communications: Production Meetings" in Site Reliability Engineering, Chapter 31), regularly talk about trends in pager load based on the structured data collected. We've found a 21-day trailing average to be useful.

Set up ticket alerts, possibly targeted at tech leads or managers, for

When pager load crosses a "warning" threshold that your team agrees on beforehand.

Hold regular meetings between the SRE team and developer team to discuss the current state of production and the outstanding production bugs that are paging SRE.

## On-Call Flexibility

### Shift Length

For example, instead of asking a single engineer to be on-call for 24 hours a day across an entire week-long shift, it would be better for two engineers to split a week of on-call, with one person on-call during the day and one on-call overnight.

In our experience, 24 hours of on-call duty without reprieve isn't a sustainable setup. While not ideal, occasional overnight 12-hour shifts at least ensure breaks for your engineers. Another option is to shorten shifts to last less than a week—something like 3 days on, 4 days off.

As mentioned in Chapter 11 of Site Reliability Engineering, Google SRE compensates support outside of regular hours with a reduced hourly rate of pay.

We've also found that making all members of the on-call rotation sit together, regardless of job title and function area, helps improve team relations tremendously. Encourage teams to eat lunch with each other. Don't underestimate the power of relatively straightforward changes like these. It plays directly into team dynamics.

# Chapter 9 - Incident Response

---

## Incident Management at Google

### Incident Command System

Incident response frameworks have three common goals, also known as the "three Cs" (3Cs) of incident management:

- Coordinate response effort.
- Communicate between incident responders, within the organization, and to the outside world.
- Maintain control over the incident response.

## Main Roles in Incident Response

The main roles in incident response are the Incident Commander (IC), Communications Lead (CL), and Operations or Ops Lead (OL). Incident Management At Google (IMAG) organizes these roles into a hierarchy: the IC leads the incident response, and the CL and OL report to the IC.

The IC may either hand off their role to someone else and assume the OL role, or assign the OL role to someone else. The OL works to respond to the incident by applying operational tools to mitigate or resolve the incident.

While the IC and OL work on mitigating and resolving the incident, the CL is the public face of the incident response team. The CL's main duties include providing periodic updates to the incident response team and stakeholders, and managing inquiries about the incident.

Both the CL and OL may lead a team of people to help manage their specific areas of incident response. These teams can expand or contract as needed. If the incident becomes small enough, the CL role can be subsumed back into the IC role.

## Case Study 1: Software Bug—The Lights Are On but No One's (Google) Home

The rollout was happening on a weekend, when developers were not readily available. The team had not followed the best practice of performing rollouts only during business days to ensure developers are around in case something goes wrong.

## Case Study 2: Service Fault—Cache Me If You Can

When three or more people work on an incident, it's useful to start a collaborative document that lists working theories, eliminated causes, and useful debugging information, such as error logs and suspect graphs. The document preserves this information so it doesn't get lost in the conversation.

Having the ability to mitigate an outage before its cause is fully understood is crucial for running robust services with high availability.

It's important to remember that first responders must prioritize mitigation above all else, or time to resolution suffers. Having a generic mitigation in place, such as rollback and drain, speeds recovery and leads to happier customers.

Ultimately, customers do not care whether or not you fully understand what caused an outage. What they want is to stop receiving errors.

With mitigation as top priority, an active incident should be addressed as follows:

1. Assess the impact of the incident.
1. Mitigate the impact.
1. Perform a root-cause analysis of the incident.
1. After the incident is over, fix what caused the incident and write a postmortem.

## Case Study 4: Incident Response at PagerDuty

### Major incident response at PagerDuty

One way we teach teamwork is by participating in Failure Friday. PagerDuty drew inspiration from Netflix's Simian Army to create this program.

Playing time-bound simulation games While Failure Friday exercises go a long way toward training engineers on different roles and processes, they can't fully replicate the urgency of actual major incidents. We use simulation games with a time-bound urgency to capture that aspect of incident response.

"Keep Talking and Nobody Explodes" is one game we've leveraged heavily. It requires players to work together to defuse bombs within time limits. The stressful and communication-intensive nature of the game forces players to cooperate and work together effectively.

At PagerDuty, how we handle incident response relates directly to the success of the company. Rather than facing such events unprepared, we purposefully prepare for incidents by conducting simulation exercises, reviewing previous incidents, and choosing the right tools to help us be resilient to any major incident that may come our way.

## Putting Best Practices into Practice

By the time a pager alerts you to a problem, it's too late to think about how to manage the incident. The time to start thinking about an incident management process is before an incident occurs.

### Incident Response Training

Let on-calls know they can delegate and escalate during an incident. • Encourage a mitigation-first response.

Define Incident Commander, Communications Lead, and Operations Lead roles. You can adapt and summarize your incident response framework, and create a slide

### Prepare Beforehand

- Decide on a communication channel
- Keep your audience informed. Think ahead about how you'll draft, review, approve, and release public blog posts or press releases. The templates make sharing information with the public easy and minimally stressful.
- Prepare a list of contacts
- Establish criteria for an incident

### Drills

Consider breaking your test environment so the team can perform real troubleshooting using existing tools.

## Conclusion

Be prepared for when disaster strikes. If your team practices and refreshes your incident response procedures regularly, you won't panic when the inevitable outage occurs.

# Chapter 10 - Postmortem Culture: Learning from Failure

---

Our example postmortem was shared only among members of the team. By default, the document should have been accessible to everyone at the company.

The value of a postmortem is proportional to the learning it creates.

## Organizational Incentives

Reward action item closeout

If you reward engineers for writing postmortems, but not for closing the associated action items, you risk an unvirtuous cycle of unclosed postmortems. Ensure that incentives are balanced between writing the postmortem and successfully implementing its action plan.

Reward positive organizational change You can incentivize widespread implementation of postmortem lessons by presenting postmortems as an opportunity to expand impact across an organization. Reward this level of impact with peer bonuses, positive performance reviews, promotion, and the like.

## Hold up postmortem owners as leaders

Celebrating postmortems through emails or meetings, or by giving the authors an opportunity to present lessons learned to an audience, can appeal to individuals that appreciate public accolades.

Setting up the owner as an "expert" on a type of failure and its avoidance can be rewarding for many engineers who seek peer acknowledgment.

At Google, we hold "FixIt" weeks twice a year. SREs who close the most postmortem action items receive small tokens of appreciation and (of course) bragging rights. Figure 10-3 shows an example of a postmortem leaderboard.

## Tools and Templates

Google has shared a version of our postmortem template in Google Docs format at http://g.co/SiteReliabilityWorkbookMaterials. Internally, we primarily use Docs to write postmortems because it facilitates collaboration via shared editing rights and comments.

### Other industry templates

Several other companies and individuals have shared their postmortem templates:

- Pager Duty - An adaptation of the original Google Site Reliability Engineering book template
- A list of four templates hosted on GitHub
- GitHub user Julian Dunn
- Server Fault

These charts show us trends like how many postmortems we have per month per organization, incident mean duration, time to detect, time to resolve, and blast radius.

Here are some third-party tools that can help you create, organize, and analyze postmortems:

- Pager Duty Postmortems
- Morgue by Etsy
- VictorOps

# Chapter 11 - Managing Load

---

Niantic introduced jitter and truncated exponential backoff to their clients, which curbed the massive synchronized retry spikes experienced during cascading failure.

# Chapter 12 - Introducing Non-Abstract Large System Design

---

Throughout the design process, we continued to improve upon each iteration by asking the four key NALSD questions:

- Is it possible? Can we build it without "magic"?
- Can we do better? Is it as simple as we can reasonably make it?
- Is it feasible? Does it fit within our practical constraints (budget, time, etc.)?
- Is it resilient? Will it survive occasional but inevitable disruptions?

# Chapter 13 - Data Processing Pipelines

---

## Pipeline Best Practices

Data freshness Most pipeline data freshness SLOs are in one of the following formats:

- X% of data processed in Y [seconds, days, minutes].
- The oldest data is no older than Y [seconds, days, minutes].
- The pipeline job has completed successfully within Y [seconds, days, minutes].

## Data correctness

Another data correctness SLO involves backward-looking analysis. For example, you might set a target that no more than 0.1% of your invoices are incorrect per quarter.

You might set another SLO target for the number of hours/days that bad data or errors are served from the pipeline output data. The notion of data correctness varies by product and application.

## End-to-end measurement

You could monitor each stage individually and offer an SLO on each one, but customers only care about the SLO for the sum of all stages.

## Plan for Dependency Failure

Once you define your SLO, it's good practice to confirm that you aren't overdepending on the SLOs/SLAs of other products that fail to meet their commitments.

Once you identify any third-party dependencies, at a minimum, design for the largest failure accounted for in their advertised SLAs.

In summary, it's good practice to prepare for the day when the systems you depend on are unavailable. Even the best products will fail and experience outages. Regularly practice disaster recovery scenarios to ensure your systems are resilient to common and uncommon failures. Assess your dependencies and automate your system responses as much as possible.

## System diagrams

At Google, we encourage teams to draw system diagrams that show each component (both pipeline applications and data stores), and the transformations that happen at each step.

## Playbook entries

Each alert condition in your system should have a corresponding playbook entry that describes the steps to recovery. At Google, we find it useful to link this documentation in any alert messages sent to on-call engineers.

## Map Your Development Lifecycle

### Staging

Before deploying to production, it's useful to run your system in a preproduction (or staging) environment. The data in your staging environment should be as close to actual production data as possible. We recommend keeping a full copy of production data or at least a representative subset. Unit tests won't catch all pipeline issues, so it's important to let the data flow through the system end-to-end to catch integration issues.

Pipeline maturity matrix The matrix in Table 13-2 measures five key characteristics (but you can extend the matrix to measure other characteristics you wish to optimize or standardize for):

- Failure tolerance
- Scalability
- Monitoring and debugging
- Transparency and ease of implementation
- Unit and integration testing

## Case Study: Spotify

We provide our customers with three SLO types for our event delivery system: timeliness, completeness, and skewness (discussed next).

### Timeliness

Our timeliness SLO is defined as the maximum delay of delivering an hourly bucket of data. Delivery delay is calculated as the time difference between when the bucket was delivered and the earliest theoretical time the bucket could have been closed.

Timeliness of data delivery is the metric we use to evaluate the performance of our data pipelines. To measure and visualize timeliness, we use a tool called Datamon, our internal data monitoring tool that was built around the notion of hourly buckets. Figure 13-8 shows a typical Datamon UI. Each green rectangle (in grayscale, the vast majority of the rectangles) represents an on-time hourly bucket. Gray rectangles (clustered here on the righthand side) indicate buckets that have not been delivered, while red rectangles (3 dark rectangles on the very top row) indicate buckets that weren't delivered within the required SLO. Days when all hours were successfully delivered are shown as a single green rectangle.

To help us prioritize delivery of events during an incident, our event delivery

System's timeliness SLO is split into three priority tiers: high, normal, and low. Our customers configure to the appropriate tier for their event type.

### Skewness

We define our skewness SLO as the maximal percentage of data that can be misplaced on a daily basis.

### Completeness

Events can be lost in a distributed system in many ways—for example, a new release of our software may contain a bug, a cloud service may go down, or a developer might accidentally delete some persisted events. To ensure we are alerted about data loss, we measure completeness. We define completeness as the percentage of events that are delivered after they are successfully published to the system.

We report on skewness and completeness daily. To measure these values, we use an internal auditing system that compares the counts for all published and delivered events.

In this regard, we use the analogy that event delivery should behave like a postal service: your mail should be delivered on time, intact, and unopened.

## System monitoring

The main problem with using an SLO violation as criteria for monitoring is that we get alerted after our customers have been affected. To avoid this, we need sufficient operational monitoring of our system to resolve or mitigate issues before an SLO is broken.

Assuming that most of the requests are similar, logging every request doesn't add much value. Additionally, when too many requests are logged, it becomes difficult to find other log entries, disk fills up faster, and the overall performance of our service starts to degrade. A better approach is to either rate-limit the amount of logged requests, or to log only interesting requests (like the ones that result in unhandled exceptions).

## Capacity planning

We provision each component to have 50% of CPU usage during peak hours. This provision acts as a safety margin that allows our system to handle unexpected bursts of traffic.

## Development process

For testing purposes, a representative fraction of production traffic is mirrored in the staging system, which is a replica of the system running in production. At the second deployment stage, the change is deployed to a small subset of production instances, or canaries. We perform a full production deployment only after we ensure that everything went well, both in staging and canaries (see Chapter 16).

## Incident handling

When dealing with an incident, our first priority is to mitigate the damage and return the system to a stable previous state.

# Chapter 14 - Configuration Design and Best Practices

---

## Configuration and Reliability

The impact of a well-crafted (or poorly crafted) configuration interface is similar to the impact of code quality on system maintainability over time.

## Configuration Philosophy

In the following philosophy, our ideal configuration is no configuration at all.

However, it highlights the desirable direction of configuration: away from a large number of tunables and toward simplicity.

While this ideal reduces the amount of control we can exercise over a system, it decreases both the surface area for error and cognitive load on the operator. As the complexity of systems grows, operator cognitive load becomes increasingly important.

When we've applied these principles in practical systems at Google, they typically resulted in easy, broad adoption and low cost for internal user support.

## Configuration Asks Users Questions

In modern software systems, we can approach this model from two different perspectives:

### Infrastructure-centric view

It's useful to offer as many configuration knobs as possible. Doing so enables users to tune the system to their exact needs. The more knobs, the better, because the system can be tuned to perfection.

### User-centric view

Configuration asks questions about infrastructure that the user must answer before they can get back to working on their actual business goal. The fewer knobs, the better, because answering configuration questions is a chore.

Driven by our initial philosophy of minimizing user inputs, we favor the user-centric view.

Perhaps counterintuitively, limited configuration options can lead to better adoption than extremely versatile software—onboarding effort is substantially lower because the software mostly works "out of the box."

## Mandatory and Optional Questions

In order to remain user-centric and easy to adopt, your system should minimize the number of mandatory configuration questions.

The easiest path to reduce mandatory questions is to convert them to optional questions, which means providing default answers that apply safely and effectively to most, if not all, users. For example, instead of requiring the user to define whether an execution should be dry-run or not, we can simply do dry-run by default.

Dynamic default means we don't need to ask the user to determine the right number of threads for the system to deploy on a given platform.

When choosing default answers for optional questions, regardless of whether you opt for static or dynamic defaults, think carefully about the impact of your choice. Experience shows that most users will use the default, so this is both a chance and a responsibility.

## Escaping Simplicity

It's useful to think about optimizing for the sum of hours spent configuring across the organization.

Consider not only the act of configuration itself, but also the decision paralysis users might experience when presented with many options, the time it takes to correct the configuration after taking a wrong turn, the slower rate of change due to lower confidence, and more.

When you are considering configuration design alternatives, the option that accomplishes a complex configuration in fewer but significantly harder steps may be preferable if it makes supporting the most common use cases significantly easier.

If you find that more than a small subset of your users need a complex configuration, you may have incorrectly identified the common use cases. If so, revisit the initial product assumptions for your system and conduct additional user research.

## Mechanics of Configuration

### Semantic validation

While most languages offer syntax validation out of the box, don't overlook semantic validation. Even if your configuration is syntactically valid, is it likely to do useful things? Or did the user reference a nonexistent directory (due to a typo), or need a thousand times more RAM than they actually have (because units aren't what the user expected)?

Validating that the configuration is semantically meaningful, to the maximum extent possible, can help prevent outages and decrease operational costs.

For every possible misconfiguration, we should ask ourselves if we could prevent it at the moment the user commits the configuration, rather than after changes are submitted.

### Configuration syntax

Built-in standardization minimizes relatively unimportant discussions about formatting and decreases cognitive load as contributors switch projects.

## Safe Configuration Change Application

For a configuration change to be safe, it must have three main properties:

1. The ability to be deployed gradually, avoiding an all-or-nothing change
1. The ability to roll back the change if it proves dangerous
1. Automatic rollback (or at a minimum, the ability to stop progress) if the change leads to loss of operator control

Rolling back the offending configuration can mitigate an outage much more quickly than attempting to patch it with a temporary fix—there is inherently lower confidence that a patch will improve things.

In order to be able to roll forward and roll back configuration, it must be hermetic.

# Chapter 15 - Configuration Specifics

---

## A Very Quick Introduction to Jsonnet

Jsonnet is a hermetic open source DSL that can be used as a library or command-line tool to provide configuration for any application. It is used widely both inside and outside Google.

The language is designed to be familiar to programmers: it uses Python-like syntax, object orientation, and functional constructs. It is an extension of JSON, meaning that a JSON file is simply a Jsonnet program that outputs itself. Jsonnet is more permissive with quotes and commas than JSON, and supports comments. More importantly, it adds computational constructs.

## Generating Config in Specific Formats

Jsonnet outputs JSON, which is compatible with many applications. JSON is also sufficient for consumers of languages that extend JSON, such as JavaScript, YAML, or HashiCorp's Configuration Language. If this is your situation, you don't need to perform any further integration work.

- Terraform firewall configuration from a single Jsonnet evaluation that defines the port only once.
- Configure your monitoring dashboards, retention policies, and alert notification pipelines from the same files.

## Integrating the Configuration Language

The most straightforward approach is to emit a single Kubernetes object from each execution of Jsonnet, then pipe the resulting JSON directly into kubectl, which processes the JSON as if it's YAML. Alternatively, you could emit a YAML stream (a sequence of such objects5) or a single kubectl list object, or have Jsonnet emit multiple files from the same config. For further discussion, see the Jsonnet website.

As described in Chapter 14, while simplicity should be fundamental to your design, the ability to escape simplicity is important. Template overrides provide a useful escape hatch to change specific details that might normally be considered too low-level.

In general, abstracting commonalities across different configurations promotes separation of concerns and has the same benefits as modularity in programming languages.

A single team might need to create multiple versions of their configuration that are almost (but not quite) the same—for example, when managing deployments across varied environments (prod/stage/dev/test), tuning deployments on different architectures, or adjusting capacity in different geographies.

As mentioned earlier, if you can remove configuration altogether, doing so is always your best option.

For the same reason, don't rely on the configuration language to fix inconsistent naming, plurals, or mistakes in the underlying model— fix them in the model itself.

If you can't fix inconsistencies in the model, it is better to live with them at the language level to avoid even more inconsistency.

In our experience, configuration changes tend to dominate outage root causes over time in a system (see our list of top causes of outages in Appendix C). Validating your config changes is a key step to maintaining reliability.

We recommend validating the generated config data immediately after configuration execution. Syntactic validation alone (i.e., checking whether JSON is parsable) won't find many bugs.

You can validate Jsonnet's JSON with JSONschema.

No matter how you decide to validate, do not ignore unrecognized field names, as they may indicate a typo at the configuration language level. Jsonnet can mask fields that should not be output using the :: syntax. It's also a good idea to perform the same validation in a precommit hook.

## Effectively Operating a Configuration System

### Versioning

Most languages, including Jsonnet, do not provide any specific support for versioning; instead, you can easily use directories. For a practical example in Jsonnet, see the ksonnet-lib repository, where the version is the first component of the imported path: local k = import 'ksonnet.beta.2/k.libsonnet';

### Tooling

Consider how you will enforce style and lint your configurations, and investigate if there's an editor plug-in that integrates these tools into your workflow.

You can also use precommit hooks to run the same tools to ensure checked-in config is high quality.

### Testing

In Jsonnet, you can write tests as Jsonnet files that:

1. Import the library to be tested.
1. Exercise the library.
1. Use either the assert statement or the standard library assertEqual function to validate its output. The latter presents any mismatching values in its error messages.

## When to Evaluate Configuration

Our critical properties include hermeticity; that is, configuration languages must generate the same config data regardless of where or when they execute.

### Very Early: Checking in the JSON

You can generate JSON from the Jsonnet code before checking both in to version control.

The typical workflow is as follows:

1. Modify the Jsonnet files.
1. Run the Jsonnet command-line tool (perhaps wrapped in a script) to regenerate JSON files.
1. Use a precommit hook to ensure that the Jsonnet code and JSON output are always consistent.
1. Package everything into a pull request for a code review.

**Pros**

- The reviewer can sanity-check the concrete changes—for example, a refactoring should not affect the generated JSON at all.
- You can inspect line annotations by multiple authors across different versions at both the generated and abstracted level. This is useful for auditing changes.
- You don't need to run Jsonnet at runtime, which can help to limit complexity, binary size, and/or risk exposure.

**Cons**

- The generated JSON is not necessarily readable—for example, if it embeds long strings.
- The JSON may not be suitable for checking into version control for other reasons—for example, if it's too large or contains secrets.
- Merge conflicts may arise if many concurrent edits to separate Jsonnet files converge to a single JSON file.

### Middle of the Road: Evaluate at Build Time

You can avoid checking JSON into source control by running the Jsonnet commandline utility at build time and embedding the generated JSON into the release artifact (e.g., as a tarball). At Google, we commonly favor this approach because of the pros listed next.

**Pros**

- You have the ability to control runtime complexity, binary size, and risk exposure without having to rebuild the JSON files in each pull request.
- There's no risk of desynchronization between originating Jsonnet code and resulting JSON.

**Cons**

- The build is more complex.
- It's harder to evaluate the concrete change during code review.

### Late: Evaluate at Runtime

Linking the Jsonnet library allows the application itself to interpret the config at any time, yielding an in-memory representation of the generated JSON config.

**Pros**

- It's simpler, as you don't need a prior evaluation.
- You gain the ability to evaluate Jsonnet code provided by the user during execution.

**Cons**

- Any linked library increases the footprint and risk exposure.
- Configuration bugs may be discovered at runtime, which is too late.
- If the Jsonnet code is untrusted, you must take special care. (We discuss why in Guarding Against Abusive Configuration.)

At a minimum, the critical properties of a configuration language are good tooling, hermetic configurations, and separation of configuration and data.

# Chapter 16 - Canarying Releases

---

# Balancing Release Velocity and Reliability

## Separating Components That Change at Different Rates

Your services are composed of multiple components with different rates of change: binaries or code, environments such as JVM, kernel/OS, libraries, service config or flags, feature/experiment config, and user config. If you have only one way to deploy changes, actually allowing these components to change independently may be difficult.

Feature flag or experiment frameworks like Gertrude, Feature, and PlanOut allow you to separate feature launches from binary releases. If a binary release includes multiple features, you can enable them one at a time by changing the experiment configuration.

That way, you don't have to batch all of these changes into one big change or perform an individual release for each feature. More importantly, if only some of the new features don't behave as expected, you can selectively disable those features until the next build/release cycle can deploy a new binary.

## What Is Canarying?

If a release deploys instantly everywhere, any defects will deploy in the same way.

## Canary Implementation

### Minimizing Risk to SLOs and the Error Budget

Global deployment can place the SLO at risk fairly quickly. If we deploy the candidate from our trivial example, we would risk failing 20% of requests. If we instead use a canary population of 5%, we serve 20% errors for 5% of traffic, resulting in a 1% overall error rate (as seen earlier in Figure 16-3).

### Choosing a Canary Population and Duration

When choosing an appropriate canary duration, you need to factor in development velocity.

Running simultaneous canaries also increases the risk of signal contamination if the canaries overlap.

For basic evaluation, we do not need a terribly large canary population in order to detect key critical conditions. However, a representative canary process requires decisions across many dimensions:

### Size and duration

It should be sizeable and last long enough to be representative of the overall deployment. Terminating a canary deployment after receiving just a handful of queries doesn't provide a useful signal for systems characterized by diverse queries with varied functionality. The higher the processing rate, the less time is required to get a representative sample in order to ensure the observed behavior is actually attributable to the canaried change, and not just a random artifact.

### Traffic volume

We need to receive enough traffic on the system to ensure it has handled a representative sample, and that the system has a chance to react negatively to the inputs. Typically, the more homogeneous the requests, the less traffic volume you need.

Time of day Performance defects typically manifest only under heavy load, so deploying at an off-peak time likely wouldn't trigger performance-related defects.

Metrics to evaluate The representativeness of a canary is tightly connected to the metrics we choose to evaluate (which we'll discuss later in this chapter). We can evaluate trivial metrics like query success quickly, but other metrics (such as queue depth) may need more time or a large canary population to provide a clear signal.

Frustratingly, these requirements can be mutually at odds. Canarying is a balancing act, informed both by cold analysis of worst-case scenarios and the past realistic track record of a system. Once you've gathered metrics from past canaries, you can choose canary parameters based upon typical canary evaluation failure rates rather than hypothetical worst-case scenarios.

## Selecting and Evaluating Metrics

### Metrics Should Indicate Problems

First and foremost, the metric needs to be able to indicate problems in the service. This is tricky because what constitutes a "problem" isn't always objective.

We typically recommend using SLIs as a place to start thinking about canary metrics. Good SLIs tend to have strong attribution to service health. If SLIs are already being measured to drive SLO compliance, we can reuse that work.

If the idea of acceptable behavior is overly strict, we will get lots of false positives; that is, we will think a canary deployment is bad, even though it isn't. Conversely, if a definition of acceptable behavior is too loose, we will be more likely to let a bad canary deployment go undetected.

In this case, our best metrics are likely the HTTP return codes and latency of response because their degradation most closely maps to an actual problem that impacts users.

### Metrics Should Be Representative and Attributable

The source of changes in the observed metrics should be clearly attributable to the change we are canarying, and should not be influenced by external factors.

## Requirements on Monitoring Data

When conducting canary evaluation, you must be able to compare the canary signals to the control signals. Often, this requires some care in structuring the monitoring system—effective comparisons are straightforward and produce meaningful results.

When collecting monitoring data, it is important to be able to perform fine-grained breakdowns that enable you to differentiate metrics between the canary and control populations.

## Related Concepts

### Blue/Green Deployment

Blue/green deployment maintains two instances of a system: one that is serving traffic (green), and another that is ready to serve traffic (blue).

One downside is that this setup uses twice as many resources as a more "traditional" deployment. In this setup, you are effectively performing a before/after canary (discussed earlier).

Both your evaluations and the metrics that compare the blue environment to the green environment should be tied to traffic control. This setup resembles an A/B canary, where the green environment is the control, the blue environment is the canary deployment, and the canary population is controlled by the amount of traffic sent to each.

Just as testing methodology must evolve alongside system requirements and design, so must canarying.

# Part III - Processes

# Chapter 17 - Identifying and Recovering from Overload

---

Operational load (or operational workload) is a term that describes the ongoing maintenance tasks that keep systems and services running at optimal performance.

There are three distinct types of operational load: pages, tickets, and ongoing operational responsibilities. Pages typically require immediate attention, and tickets related to urgent problems can have tight deadlines. Both pages and urgent tickets interrupt SREs from working on engineering projects that support the team's operational responsibilities. For that reason, we refer to them as interrupts.

## From Load to Overload

Work overload often happens when a team doesn't have enough time to handle all these tasks—an objective reality when the number of tasks assigned to a team can't be completed within the given deadline for each task.

Perceived overload is more subjective, and happens when individuals on the team feel that they have too much work. This usually happens when several organizational or work changes take place over a short period of time, but the team has little opportunity to communicate with leadership about the changes.

If your work isn't properly prioritized, every task can seem equally urgent, leading to both actual and perceived overload.

When a team faces perceived overload, reprioritizing can help decrease the amount of urgent work, creating space for them to tackle the sources of overload through project work.

For example, you might measure workload by the number of tickets and pages the team handles.

## Case Study 1: Work Overload When Half a Team Leaves

Most of the backlog seemed to be either critical or worth the effort to us, so it just didn't feel right to cancel or delay projects indefinitely. We didn't realize we were in the grip of a sunk cost fallacy.

We gathered the team in a room and listed all the team's responsibilities, including project backlog, operational work, and tickets. Then we triaged every list item. Viewing every single one of our work tasks (even though the list barely fit on the whiteboard) helped us identify and redefine our actual priorities. We were then able to find ways to minimize, hand off, or eliminate lower-priority work items.

### Implementation

We identified low-effort automation that, while not critical, would significantly reduce operational load once deployed.

We also identified common problems that we could document that would enable self-service.

Writing the procedures our customers needed didn't take long, and removed some repetitive work from our queue.

We closed as many of our backlogged tickets as we reasonably could. Most of these tickets turned out to be obsolete, redundant, or not as urgent as they claimed.

It turned out that almost none of these tasks were impactful or important enough to resume.

In two days—one day of intensive triage plus one day of documenting processes and implementing automation—our much smaller team addressed a backlog of several months of interrupts.

### Lessons Learned

We decided that each team member should have 10 or fewer open tickets to avoid overload. If the team lead notices that team members have more than 10 tickets, they can do one or some combination of the following:

- Remind the team to close out stale tickets.
- Sync with overloaded team members and offload tickets from them.
- Prompt individual team members to address their ticket queue.
- Organize a team-wide one-day ticket fix-it.
- Assign work to fix the sources of tickets, or operational work to reduce future tickets.

## Case Study 2: Perceived Overload After Organizational and Workload Changes

### Implementation

**Short-term actions**

We auto-assigned tickets to on-callers, and the on-caller was responsible for these tickets even after their shift ended. Our new metric measured how much time an on-caller needed to resolve a ticket after their shift.

**Mid-term actions**

While training requires an investment of time and energy, disseminating knowledge meant that all team members (and future hires) could troubleshoot and fix issues more quickly in the future. Training coworkers improved our confidence, because we came to realize that we actually knew quite a bit about the services. As they gained knowledge, team members started to find new ways to manage services, improving their reliability and reducing overload.

We discussed repetitive pages and pages that resulted in no action at length in the weekly production meeting,

**Long-term actions**

Uniformity has a double benefit: it decreases cognitive load for SREs and makes it easier to write automation that can be used across services.

### Lessons Learned

Perceived overload _is_, in fact, overload, and has as much impact to a team as work overload caused by other factors.

## Strategies for Mitigating Overload

### Recognizing the Symptoms of Overload

As a manager, don't impose a measure on the team without getting an idea of each individual's workload and work habits. Team members might feel that you don't understand the work if you insist on using a specific measure. For example, if you're evaluating load by the number of days it takes to fix an issue, one person might work a full day fixing an issue, while another person might distribute the work across several days, along with other work.

### Reducing Overload and Restoring Team Health

**Identify and alleviate psychosocial stressors**

When it comes to fixing a dysfunctional team, first and foremost, individual team members need to regain their sense of psychological safety. A team can function only as well as its individual members. You can start by identifying and alleviating psychosocial stressors8 for each individual and the team as a whole. Which of these factors do you actually have control over? You can't control whether or not a team member has a major illness, but you can control the size of your team's backlog (as seen in Case Study 1) or silence pages (as in Case Study 2).

Decision making should be transparent and, if possible, democratic. Each team member should have a feeling of control over the situation. For example, the brainstorming session in Case Study 2 helped the team identify and discuss issues.

**Protect yourself in the future**

When your team is in overload, prioritize project work that pays down repetitive toil even more than you would if you weren't overloaded. You will profit in the future.

## Conclusion

Perceived overload is a special form of overload that can't be measured by the amount of toil or operational work. It is hard to pinpoint and to eliminate.

In order to keep a team's workload in balance, it's important to constantly monitor (perceived or nonperceived) overload. To better serve your users and do good work, you need to first show respect to yourself and your team.

# Chapter 18 - SRE Engagement Model

---

Simply put, SRE principles aim to maximize the engineering velocity of developer teams while keeping products reliable.

Given a large production landscape, and with the knowledge that they can't cover every service, an SRE team must decide where to focus their attention to achieve the best results.

Although SRE engagement often builds around one or more services, the engagement entails much more than the services themselves — it focuses on understanding the aims of developer and product teams and finding the right way to support them.

Regardless of your team's size, it's important to proactively define the role of SRE and manage communication and collaboration with product development.

## The Service Lifecycle

For example, if the development team begins planning a replacement service for an SRE-supported service, SRE might be involved in the new service very early on.

Alternatively, an SRE team might formally engage with a service once it has been generally available for months or years and is now facing reliability or scaling challenges.

### Phase 1: Architecture and Design

SRE can influence the architecture and design of a software system in different ways:

- Creating best practices, such as resilience to various single points of failure, that a developer team can employ when building a new product
- Documenting the dos and don'ts of particular infrastructure systems (based upon prior experience) so developers can choose their building blocks wisely, use them correctly, and avoid known pitfalls
- Providing early engagement consulting to discuss specific architectures and design choices in detail, and to help validate assumptions with the help of targeted prototypes
- Joining the developer team and participating in development work
- Codesigning part of the service

Fixing architectural mistakes becomes more difficult later in the development cycle. Early SRE engagement can help avoid costly redesigns that become necessary when systems interact with real-world users and need to scale in response to service growth.

### Phase 2: Active Development

As the product takes shape during active development, SREs can start productionizing the service—getting it in shape to be released into production.

Productionalization typically includes capacity planning, setting up extra resources for redundancy, planning for spike and overload handling, implementing load balancing, and putting in place sustainable operational practices like monitoring, alerting, and performance tuning.

### Phase 3: Limited Availability

As a service progresses toward Beta, the number of users, variety of use cases, intensity of usage, and availability and performance demands increase. At this stage, SRE can help measure and evaluate reliability.

We strongly recommend defining SLOs before general availability (GA) so that the service teams have an objective measure of how reliable the service is.

During this phase, the SRE team can also help scale the system by building a capacity model, acquiring resources for upcoming launch phases, and automating turnups and in-place service resizing. SRE can ensure proper monitoring coverage and help create alerts that ideally match the upcoming service SLOs.

While service usage is still changing, the SRE team can expect an increased amount of work during incident response and operational duties because the teams are still learning how the service works and how to manage its failure modes.

We recommend sharing this work between the developer and SRE teams. That way, the developer team gains operational experience with the service and the SREs gain experience with the service in general.

### Phase 4: General Availability

In this phase, the service has passed the Production Readiness Review (see Chapter 32 in Site Reliability Engineering for more details) and is accepting all users.

While SRE typically performs the majority of operational work, the developer team should continue to field a small part of all operational and incident response work so they don't lose perspective on these aspects of the service. They might permanently include one developer in the on-call rotation to help the developers keep track of operational load.

In the early phase of GA, as the developer team focuses on maturing the service and launching the first batches of new features, it also needs to stay in the loop to understand system properties under real load.

In the later stages of GA, the developer team provides small incremental features and fixes, some of which are informed by operational needs and any production incidents that occur.

### Phase 5: Deprecation

No system runs forever. If and when a better replacement system is available, the existing system is closed for new users and all engineering focuses on transitioning users from the existing system to the new one.

### Phase 6: Abandoned

For a service with internal users, SRE hands over service management to any remaining users.

### Phase 7: Unsupported

There are no more users, and the service has been shut down. SRE helps to delete references to the service in production configurations and in documentation.

## Setting Up the Relationship

### Communicating Business and Production Priorities

SREs need to understand what the product developers expect the SRE engagement to achieve.

When engaging with a developer team, SREs should build a deep understanding of the product and business goals. SREs should be able to articulate their role and how SRE engagement can enable developers to execute toward these goals.

Teams need to regularly talk with each other about business and production priorities. The SRE and developer leadership teams should ideally work as a unit, meeting regularly and exchanging views about technical and prioritization challenges. Sometimes SRE leads join the product development leadership team.

### Identifying Risks

Because an SRE team is focused on system reliability, they are well positioned to identify potential risks. Gauging the likelihood and potential impact of those risks as accurately as possible is important, as the cost of disrupting regular development and feature flow is significant to the product and to engineers.

### Aligning Goals

In our experience, developer and SRE teams can strike the right balance here by maintaining their individual foci but also explicitly supporting the goals of the other group.

SREs can have an explicit goal to support the developer team's release velocity and ensure the success of all approved launches.

For example, SRE might state, "We will support you in releasing as quickly as is safe," where "safe" generally implies staying within error budget.

and including SREs in new feature development early so that they can participate in design conversations.

### Shared Goals: SRE Engagements at the New York Times

Before engaging with teams, we review our overall backlog for the current quarter/ year and clearly define its work items and categories. For instance, our backlog items might include:

- Add automation to set up baseline monitoring and alerting by hitting service status endpoints for applications. • Implement more reliable and/or faster build pipelines.

**Defining the Engagement**

Our SREs work with product development teams according to two different models:

- A full-time basis
- A part-time basis for fairly brief and constrained projects

We define the type of engagement based upon the SRE team's bandwidth. For fulltime engagements, we prefer to embed an SRE in a product development team. This helps provide focus and time to relieve some burden from the product engineering teams. The SRE and product teams have maximum time to learn about each other as the developers ramp up on SRE skills and capabilities.

When defining the engagement scope, we attempt to gauge the maturity of the team or the application in relation to SRE practices. We find that various teams are at different levels of maturity when it comes to thinking about SRE practices and principles. We are working on applying an application maturity model to help here.

**Setting Shared Goals and Expectations**

We emphasize that the application owners, not SREs, are directly responsible for making changes to an application.

SRE engagement is for company-wide benefit. Any new automation or tooling should improve common tools and automation used across the company and avoid one-off script development.

SREs should give the developer team a heads up about any new processes the engagement might introduce (for example, load testing).

The engagements may involve Application Readiness Reviews (ARRs) and Production Readiness Reviews (PRRs), as described in Chapter 32 of Site Reliability Engineering. Proposed changes from ARR and PRR must be prioritized jointly by the developers and the SREs.

When we set shared goals, we write them jointly with the development team and divide the goals into milestones.

Our common pattern when setting goals is to:

1. Define the scope of the engagement.
1. Identify the end result success story, and call it out explicitly.

**Sprints and Communication**

Any engagement with product development teams begins with a kickoff and planning meeting. Prior to kickoff, our SRE team reviews the application architecture and our shared goal to verify that the expected outcome is realistic within the given time frame. A joint planning meeting that creates epics and stories can be a good starting point for the engagement.

A roadmap for this engagement might be:

1. Review the application architecture.
1. Define shared goals.
1. Hold the kickoff and planning session.
1. Implement development cycles to reach milestones.
1. Set up retrospectives to solicit engagement feedback.
1. Conduct Production Readiness Reviews.
1. Implement development cycles to reach milestones.
1. Plan and execute launches.

We have found that providing a constant feedback loop outside of Agile sprint reviews via an agreed-upon method is useful — for example, setting up a biweekly retrospective or check-in with team managers.

**Measuring Impact**

One approach we adopted from working with Google's Customer Reliability Engineering (CRE) team is to conduct a point-in-time assessment with leads of the product engineering team before starting the engagement.

A point-in-time assessment consists of walking through a maturity matrix, gauging the maturity of the service along the various axes of concern to SRE (as described in Chapter 32 of Site Reliability Engineering), and agreeing on scores for functional areas such as observability, capacity planning, change management, and incident response.

After the engagement ends and the development team is performing on its own, we perform the assessment again to measure the value SRE added. If we have a maturity model in place, we measure against the model to see if the engagement results in a higher level of maturity. As the engagement comes to an end, we plan for a celebration!

### Setting Ground Rules

At Google, every SRE team has two major goals:

**Short term**

Fulfill the product's business needs by providing an operationally stable system that is available and scales with demand, with an eye on maintainability.

**Long term**

Optimize service operations to a level where ongoing human work is no longer needed, so the SRE team can move on to work on the next high-value engagement.

To this end, the teams should agree upon some principles of cooperation, such as:

- Definitions of (and a hard limit on) operational work.
- An agreed-upon and measured SLO for the service that is used to prioritize engineering work for both the developer and SRE teams. You can start without an SLO in place, but our experience shows that not establishing this context from the beginning of the relationship means you'll have to backtrack to this step later.
- An agreed-upon quarterly error budget that determines release velocity and other safety parameters, such as excess service capacity to handle unexpected usage growth.
- Developer involvement in daily operations to ensure that ongoing issues are visible, and that fixing their root causes is prioritized.

### Planning and Executing

Proactive planning and coordinated execution ensure that SRE teams meet expectations and product goals while optimizing operations and reducing operational cost. We suggest planning at two (connected) levels:

- With developer leadership, set priorities for products and services and publish yearly roadmaps.
- Review and update roadmaps on a regular basis, and derive goals (quarterly or otherwise) that line up with the roadmap.

## Sustaining an Effective Ongoing Relationship

### Investing Time in Working Better Together

The simple act of spending time with each other helps SREs and developers collaborate more effectively.

It's also a good idea for SREs to meet periodically with other SRE teams who run services that either send traffic to the service or provide common infrastructure that the service uses.

### Maintaining an Open Line of Communication

SREs can give a quarterly "state of production" talk to product development leadership to help them understand where they should invest resources and how exactly SRE is helping their product or service.

In a similar vein, developers can give a periodic "state of the product" talk to the SRE team or involve SRE in the developer team's executive presentations.

### Performing Regular Service Reviews

As the decision makers for the service's future, the SRE and developer team leads responsible for the service should meet face-to-face at least once a year.

During this meeting, we typically share our roadmaps for the next 12–18 months and discuss new projects and launches.

SRE teams sometimes facilitate a retrospective exercise, where the leads discuss what the teams want to stop doing, keep doing, and start doing.

### Reassessing When Ground Rules Start to Slip

- The teams identify specific engineers who must drop their lower-priority tasks to focus on the regression.
- Both teams call a "reliability hackathon"
- A feature freeze is declared and the majority of both teams focus on resolving the regression.
- Technical leadership determines that the reliability of the product is at acute risk, and the teams call an "all hands on deck" response.

### Adjusting Priorities According to Your SLOs and Error Budget

If a service is in danger of missing the SLO or has exhausted the error budget, both teams can work with high priority to get the service back into safety.

They can address the situation through both tactical measures (for example, overprovisioning to address traffic-related performance regressions) and more strategic software fixes (such as optimizations, caching, and graceful degradation).

If a service is well within SLO and has ample error budget left, we recommend using the spare error budget to increase feature velocity rather than spending overproportional efforts on service improvements.

### Handling Mistakes Appropriately

- Sleep on it
- If possible, don't conduct follow-up conversations when you're tired or emotions are high.
- Meet in person (or as close to it as possible) to resolve issues
- Be positive

## Scaling SRE to Larger Environments

Supporting Multiple Services with a Single SRE Team

Because SREs have specialized skills and are a scarce resource, Google generally maintains an SRE-to-developer ratio of < 10%. Therefore, one SRE team commonly works with multiple developer teams in their product area (PA).

Services are built on similar tech stacks. This minimizes cognitive load and enables effective reuse of technical skills.

Services are built by the same developer team or a small number of related developer teams. This minimizes the number of relationships and makes it easier to align priorities.

### Structuring a Multiple SRE Team Environment

Within Google, we support a complex developer organization. As shown in Figure 18-2, each PA consists of multiple product groups that each contain multiple products. The SRE organization shadows the developer organization hierarchically, with shared priorities and best practices at each level. This model works when all teams in a group, or all groups in a PA, share the same or similar specific business goals, and when every product group has both a product leader and an SRE lead.

If your organization has multiple SRE teams, you'll need to group them in some way. The two main approaches we've seen work well are:

- Group the teams within a product, so they don't have to coordinate with too many different developer teams.
- Group the teams within a technology stack (e.g., "storage" or "networking").

### Adapting SRE Team Structures to Changing Circumstances

Each SRE team should have a clear charter that reflects their services, technology, and operations.

When a single SRE team has too many services, rather than building new teams from scratch, we prefer to shard the existing team into multiple teams to transfer culture and grow existing leadership.

### Running Cohesive Distributed SRE Teams

Many companies don't have the resources for full global coverage, but even if you're split only across buildings (never mind continents), it's important to create and maintain a two-location arrangement.

## Ending the Relationship

On a team level, you might hand back a service if SRE no longer provides sufficient business value to merit the costs. For example:

- If a service has been optimized to a level where ongoing SRE engagement is no longer necessary
- If a service's importance or relevance has diminished
- If a service is reaching end of life

# Chapter 19 - SRE: Reaching Beyond Your Walls

---

## Truths We Hold to Be Self-Evident

### Reliability Is the Most Important Feature

The argument is simple enough:

- If a system isn't reliable, users won't trust it.
- If users don't trust a system, when given a choice, they won't use it.
- Since all software systems are governed by network effects, if a system has no users, it's worth nothing.
- You are what you measure, so choose your metrics carefully.

### Your Users, Not Your Monitoring, Decide Your Reliability

Since the value of a system is related to its users, it stands to reason that the only measure of reliability that matters is how your users experience reliability.

They're experiencing your system as unstable, and that's what they will remember when the time comes to choose between you and your competitor.

(This phenomenon is called the peak-end rule.) Your monitoring, logs, and alerting are valuable only insofar as they help you notice problems before your customers do.

### If You Run a Platform, Then Reliability Is a Partnership

When your product acts as a platform, the reliability your users experience isn't limited to the choices you make. Reliability becomes a partnership.

### Everything Important Eventually Becomes a Platform

## How to: SRE with Your Customers

### Step 1: SLOs and SLIs Are How You Speak

You want your customers to perceive your system as reliable. Otherwise, you risk losing them. It stands to reason, therefore, that you should care a lot about how they form those opinions. What do they measure? How do they measure it? Most importantly, what promises are they making to their customers?

### Step 2: Audit the Monitoring and Build Shared Dashboards

### Step 3: Measure and Renegotiate

The key question is, how satisfied are their users with the application's performance? If their users are happy, and there's no evidence that improving performance or availability will increase user adoption/retention/usage, then you're done.

You should periodically ask yourself this question to make sure that your budgets and priorities are still correct. (See Chapter 2 for a more in-depth treatment of this topic.)

### Step 4: Design Reviews and Risk Analysis

Sit down with your customer and really understand how their application is designed and operated. Do they have any hidden single point of failures (SPOFs)? Are their rollouts and rollbacks manual? Basically, conduct the same exercise you conduct for your own internal applications.

### Step 5: Practice, Practice, Practice

The final step is to create some operational rigor with your customer. Practice simulated problems (Wheel of Misfortune exercises, disaster and recovery testing, paper game days, etc.).

Develop a healthy muscle memory between the teams for effective ways to communicate during a crisis. It's a great way to build trust, lower the MTTR, and learn about weird operational edge cases that you can integrate as enhancements into your platform features.

When an incident does occur, don't just share your postmortems with your customer. Actually conduct some joint postmortems. Doing so will also build trust and teach you some invaluable lessons.

### Be Thoughtful and Disciplined

Instead, make some principled decisions about how you will make selections. Here are some common approaches:

**Revenue coverage**

Select the minimum number of customers to account for XX% of your revenue. If your revenue is heavily weighted to a few large customers, then this might be the right choice for you.

**Feature coverage**

Select the minimum number of customers to cover more than XX% of your platform features. If you run a highly diverse platform with a long tail of customers doing a lot of different things, then this approach will help you avoid surprises.

**Workload coverage**

Your platform's usage may be dominated by a few distinct use cases or customer types. Perhaps no individual customer in those types is dominant, but you can easily group them into cohorts. In that case, sampling one or two customers from each cohort is a good way to get platform coverage and discover operational differences between the use cases.

# Chapter 20 - SRE Team Lifecycles

---

## SRE Practices Without SREs

**Principle #1 - SRE needs SLOs with consequences.**

We believe that the following practices — which you can achieve without even having a single SRE—are the crucial steps toward implementing SRE practices:

- Acknowledge that you don't want 100% reliability.
- Set a reasonable SLO target. This SLO should measure the reliability that is most important to your users.
- Agree on an error budget policy that will help defend your user experience. Use the error budget to help guide:
  - Tactical actions to mitigate outages or to manage changes that return your system to a reliable state
  - Longer-term prioritization of work to make the system more reliable and use less of the error budget
- Measure the SLO and commit to following the error budget policy. This commitment requires agreement from company leadership.

## Starting an SRE Role

### Placing Your First SRE

Once you've hired your first SRE, you now need to decide where to embed them in your organization. You have three main choices:

- In a product development team
- In an operations team
- In a horizontal role, consulting across a number of teams

We recommend that you evaluate the pros and cons of each of these three options after reading this chapter, taking into account:

**Your own role and sphere of influence.**

If you're able to effectively influence product development team(s), then embedding an SRE in operations or horizontal work can help iron out gnarly production issues early.

**The immediate challenges that you face.**

If the challenges require hands-on work to mitigate a technical problem or business risk, then embedding an SRE in an operations or product team can be advantageous. Doing so removes organizational silos and facilitates easy communication between team members.

**The challenges you expect to face in the next 12 months.**

For example, if you're focusing on launches, embedding the SRE within a product development team might make sense. If you're focusing on infrastructure changes, embedding the SRE with an operations team might make more sense.

Your plan for how you want to change your organization. If you plan to move toward a centralized SRE organization, you might not want to embed SREs in product development teams initially—it might be hard to remove them from these teams later.

The person you have identified as your first SRE. Decide where this first SRE would be most productive based upon their background and skills.

### Bootstrapping Your First SRE

**Principle #2 - SREs must have time to make tomorrow better than today.**

Your first SRE's initial mission is to get up to speed on the service.

If your organization doesn't already have SLOs and error budgets as per Principle #1, your first SRE needs to perform the engineering required to design and implement these tools.

SREs must have time to make tomorrow better than today.

Initial project work might focus on one of the following:

- Improving monitoring so you can better understand the system when things go wrong.
- Addressing any high-priority actions identified in recent postmortems (see Implementing automation to reduce a specific element of toil required to run the service.

_It is vital that the SRE has a distinctive role and that their projects benefit the whole team._ Look out for signs that the SRE work is not going well:

- Their mix of work is indistinguishable from other engineering work.
- If your first SRE is on a product development team, they are doing more than their fair share of operational work, or they are the only person working on service configuration changes.
- The SLOs are not being taken seriously, and the SRE isn't making progress in measuring and defending the customer experience.

### Distributed SREs

If your organization doesn't have (or doesn't plan to have) a discrete SRE team (or teams), it's important to construct a community for distributed SREs. This community should advocate the SRE's distinctive role and drive consistent changes in reliability-focused technology or practices across teams. Without a social grouping, individual SREs may feel very isolated.

## Your First SRE Team

You might start an SRE team in a number of ways. Approaches we've used at Google, from least to most complex, include:

- Creating a new team as part of a major project
- Establishing a horizontal SRE team
- Converting an existing team (for example, an operations team)

The approach that's best for your organization is highly situational. A team needs enough SREs to handle the operational tasks required to run the service.

Addressing that workload brings us to our third principle:

**Principle #3 SRE teams have the ability to regulate their workload.**

The following sections walk through the stages of building a team, using Tuckman's performance model and stages of forming, storming, norming, and performing.

### Forming

The team you assemble should have combined experience and expertise that includes the following:

- Making changes to application software to improve reliability and performance.
- Writing software to:
  - Expedite the detection and mitigation of problems in production.
  - Automate manual processes.
- Establishing and using strong software practices and standards to facilitate longterm maintainability.
- Having a methodical and careful approach to making operational changes: be able to describe why certain practices are reliable.
- Understanding system architecture (distributed systems design and operation).

**Creating a new team as part of a major project**

Assembling a horizontal SRE team In this approach (well documented in Chapter 27 of our first book), a small team of SREs consults across a number of teams. This team might also establish best practices and tools for configuration management, monitoring, and alerting.

**Assembling a horizontal SRE team**

In this approach (well documented in Chapter 27 of our first book), a small team of SREs consults across a number of teams. This team might also establish best practices and tools for configuration management, monitoring, and alerting.

**Converting a team in place**

You might be able to convert an existing team into an SRE team.

Be careful to avoid renaming a team from "Operations" to "SRE" without first applying SRE practices and principles! If your rebranding effort fails, your organization may be poisoned against the entire concept of SRE in the future.

### Storming

Once assembled, the team needs to start working collaboratively: the team members need to work well with each other, and also with other teams.

At Google, we've had success providing a regular forum for learning and discussing SRE practices and reflecting on how the team is performing.

During this phase, encourage your new SRE team to stretch themselves.

Your new SREs should be comfortable speaking out about SRE practices that don't fit within your organization, and whether it's worth making the change so they fit.

### Risks and mitigations

During this nascent phase of the SRE journey, there are a number of ways the team might fail.

### New team as part of a major project

**Mitigations**

The team:

- Engages initially on a single important service.
- Engages as early as possible on the project, ideally at the design stage.
- Has input into the design, with a particular focus on defining SLOs and analyzing reliability risks inherent in the design.
- Partners with the product development team and works on features specific to reliability and integration with existing operational platforms.
- Is not expected to have operational responsibility on day one. Instead, this responsibility initially sits with the product development team or project team. This may be a significant cultural change that needs support from management.
- Has clear agreement on the conditions that a service must meet to be onboarded by SRE (see Chapter 32 of Site Reliability Engineering).

In addition:

- If the project involves a migration, the team should have a solid understanding of the current and future environments. If you need to recruit team members externally, consider candidates who have knowledge of software engineering and the future environment.
- Continue to keep the number of new hires to less than a third of the team so that the training effort doesn't overwhelm existing team members.

### Horizontal SRE team

**Mitigations**

The team:

- Is seeded with respected engineers who have relevant subject matter expertise.
- Undertakes project work that focuses on delivering tools (for monitoring, alerting, rollouts, best practices, checklists). These tools should have a short-term beneficial impact on at least two other teams.
- Communicates successes and benefits. An SRE team that makes an efficiency breakthrough, automates away toil, or permanently eliminates a source of system unreliability should be celebrated.
- Sees themselves as enablers, not gatekeepers. Focus on solutions, not just problems.

### A team converted in place

**Mitigations**

The team:

- Secures senior leadership support for the change.
- Renegotiates responsibilities to create the slack needed to effect change.
- Manages communication of the change very carefully.
- Has access to robust personal and technical support throughout the transition.
- Deals with the concern about job losses head on. In a lot of environments, automation eliminates portions of work, but not jobs as a whole; while this might be a step on the path to job losses, it does at least have the virtue of freeing up time to do something better (and more sellable to a future employer) than nonautomated toil.
- Can escape operational overload and have more significant impact. If engineers reduce the volume of toil enough to necessitate a smaller team, then their experience should be highly reusable elsewhere in your organization. If their experience can't be used internally, it should provide an advantage in seeking work elsewhere.
- Receives training to acquire the skills SREs need. Your product development team can provide product training, while SRE orientation can make use of this book and other external resources.
- Changes how performance is evaluated — the metrics that assess both the team and individuals. The former should be aligned with SLOs and adoption of other SRE practices; the latter should be aligned with evidence of SRE skills.
- Adds an experienced SRE or developer to the team.
- Has the freedom (budget or time) to identify and introduce new open source or cloud-based monitoring and alerting systems to enable automation. Determining whether the existing systems are sufficient should be an early priority.
- Regularly reviews progress internally and with stakeholders.

### Norming

Norming entails working past the issues raised in "Risks and mitigations" on page 405 and reaching broad agreement on best practices for the organization's SRE teams.

Teams need to agree on an acceptable level of toil, appropriate alerting thresholds, and important and relevant SRE practices. Teams also need to become selfsufficient at proactively identifying the challenges ahead of the service and setting medium and long-term goals to improve the service.

Teams should reach the following levels of maturity during the norming phase:

- SLOs and error budgets are in place, and the error budget policy is exercised following significant incidents. Leadership is interested in SLO measurements.
- On-call rotations are established and sustainable (see Chapter 8). On-call engineers are compensated for their on-call time. There is sufficient tooling, documentation, and training to support any team member during a significant incident.
- Toil is documented, bounded, and managed.
- As a result, SREs complete impactful projects that improve reliability and efficiency.
- Postmortem culture is well established. (See Chapter 10.)
- The team exhibits most of the tenets listed in Chapter 1.
- As the team solves initial issues listed in "Storming" on page 405, they capture what they learned and prevent repeating problems. The team regularly runs training exercises, such as Wheel of Misfortune or DiRT (Disaster Recovery Testing). (For more information on on-call training, see Chapter 11 in our first book and Chapter 18 in this book.)
- The product development team benefits from remaining involved in the on-call rotation.
- The team produces regular reports (e.g., quarterly) for their stakeholders that cover the highlights, lowlights, and key metrics of the reporting period.

### Performing

In the final stage of Tuckman's performance model, performing, you should expect to:

_Partner on all architecture design and change._

From the initial design phase onward, SRE should define the patterns for how software is built and structured for reliability.

_Have complete workload self-determination._

**Partnering on architecture**

The product development team should start to reach out to its partner SRE team for advice on all significant service changes. The SRE team now has the opportunity to have some of its greatest impact.

For example, the SRE team might provide early input into the design of new service architecture to reduce the likelihood of high-cost reengineering at a later date. The product development and SRE teams can acknowledge their differences in perspective on architectural decisions to arrive at a good design process. A successful engagement can add value through:

- Improved reliability, scalability, and operability
- Better reuse of existing patterns
- Simpler migration (if required)

**Self-regulating workload**

Whereas architectural partnerships should emerge somewhat organically over time, an SRE team must clearly assert Principle #3 to its partners. Doing so requires strong team leadership and clear, upfront commitment from senior management.

The ability to regulate its own workload secures the SRE team's position as an engineering team that works on the organization's most important services, equal to its product development team peers.

In practice, how an SRE team goes about determining its own workload depends on the teams with which SREs interface. At Google, SRE teams most commonly interact with a distinct product development team. In this case, the relationship has the following characteristics:

- An SRE team chooses if and when to onboard a service (see Chapter 32 of Site Reliability Engineering).
- In the event of operational overload, the team can reduce toil by:
  - Reducing the SLO
  - Transferring operational work to another team (e.g., a product development team)
- If it becomes impossible to operate a service at SLO within agreed toil constraints, the SRE team can hand back the service to the product development team.
- SRE engagement is not perpetual — it feeds itself by solving problems at scale and improving the reliability of services.

If an SRE team has solved all such problems for a service, you need to either:

— Intentionally consider what other reliability challenges the SRE team needs to tackle.
— Make an intentional decision to hand back the service to the product development team. Otherwise, your team risks attrition as SREs move on to more interesting opportunities.

In this case, you don't have the option to transfer work back to another team. Instead, consider the following tactics:

- If the service does not conform to its SLO, stop feature-related project work in favor of reliability-focused project work.
- If it becomes impossible to operate a service at SLO within agreed toil constraints, reduce your SLOs—unless management provides more capacity (people or infrastructure) to deal with the situation.

## Making More SRE Teams

When you're creating a new SRE team, we recommend that you do the following:

- Read any postmortems written after other teams were established. Identify and repeat what went well and fix and explore alternatives for things that didn't go well.
- Seed the new team with SREs from the existing team — some of your best SREs and highest-potential SREs who can rise to the challenge. In our experience, finding qualified SRE candidates is difficult, so growing a team quickly with new hires often isn't realistic.
- Standardize the framework for establishing teams and onboarding services (see Chapter 18).
- Make changes to the on-call responsibilities slowly. For example:
  - To avoid a sudden loss of skilled on-call engineers, keep team members oncall for their previous team's systems for a transitional period.
  - After the teams split, wait three to six months to split the on-call rotations.

### Service Complexity - Where to split

If a service becomes too complex for a single team to manage, there are a number of ways to split the work. Consider the following options to simplify the cognitive load on team members:

**Architectural splits**

For example, compute, storage, and network; frontend and backend; frontend and database; client and server; frontend and pipelines.

**Language splits**

SRE principles are not dependent on programming languages. However, if your SREs are deeply involved in your source code, there may be some benefit in a split along these lines. Location splits If your organization's engineering spans multiple offices, you might want to align SRE team placement with application development.

### SRE Rollout

If your initial SRE team(s) are successful, your organization may want more of them. We recommend carefully prioritizing the services that receive SRE support. Consider the following points:

- Prioritize services for which reliability has a high financial or reputational impact. The higher the impact, the higher the priority.
- Define the minimal viable set of services that need to be up in order for the product to function. Prioritize those services and make sure that other services degrade gracefully.
- A service should not be a priority for SRE simply because it's unreliable. SRE should be applied tactically where it is most relevant for the business. You also don't want to allow your developers to ignore reliability until after SREs are engaged.

### Geographical Splits

As described in Chapter 11 of our first book, Google commonly staffs sister SRE teams on different continents. We do this for a number of reasons:

**Service reliability**

If a major incident (e.g., natural disaster) prevents one team from operating, the other team can continue to support a service.

**On-call stress**

Splitting the pager rotation into 12-hour shifts allows proper breaks for on-call engineers.

**Recruiting and retaining talent**

An on-call shift that overlaps the normal working day broadens the base of engineers that we can recruit into SRE roles, and underlines the engineering part of our role.

**Production maturity**

Splitting service responsibility across two offices tends to lead to an improvement in maturity as the need for documentation, training, and standardization become more important.

If your organization is lucky enough to already have engineering teams on multiple continents, we recommend staffing multisite SRE teams.

It's possible to have an SRE team in a different office than the development team, but in our experience, colocation provides benefits in the form of a healthy and robust interteam dialog.

Otherwise, it's harder for SREs to understand how the services evolve or how the technical infrastructure is used, and it's harder for product developers to be optimistic about infrastructure improvements.

### Placement: How many time zones apart should the teams be?

Assuming you have some choice, time zone separation is an important consideration in deciding where to locate the two teams. Unfortunately, the objectives are mutually exclusive:

- Minimizing the number of hours that on-callers have to work outside of normal office hours
- Maximizing the overlap time when both teams are online so that they can interact with each other regularly

### People and projects: Seeding the team

When you split a team geographically, the first SRE team in a new office will set the norms for future SRE teams. Your likelihood of success will be much higher if you can identify one or more SREs who are willing to relocate from the original site on a temporary or long-term basis to establish SRE practices and recruit and train the new team. The new team should also undertake a high-value project that fosters collaboration within the team and requires interaction with their sister team.

## Suggested Practices for Running Many Teams

### Mission Control

Google's Mission Control program gives engineers from product development teams the opportunity to spend six months embedded in an SRE team.

We typically match these engineers to SRE teams working in a distinctly different area from their expertise. The software engineer is trained in production systems and practices and eventually goes on-call for that service. After six months, some engineers decide to stay in SRE; others return to their old teams with a much better appreciation for the production environment and SRE practices. SRE teams benefit from additional engineering resources and gain valuable insight into gaps and inaccuracies in training material and documentation.

### SRE Exchange

Google's SRE Exchange program lets an SRE spend a week working alongside a different SRE team. The visiting SRE observes how the host team works and shares practices from their home team that might be useful to the host team. At the end of the exchange, the visiting SRE writes a trip report describing their week, their observations, and their recommendations for both teams. This program is useful at Google because our SRE teams are highly specialized.

### Training

Training is critical to SRE's ability to operate systems. While most of this is delivered in-team (see "Training roadmap" on page 150 in Chapter 8), consider establishing a standard training curriculum for all SREs.

At Google, all new SREs attend SRE EDU, an immersive weeklong training that introduces key concepts, tooling, and platforms that almost all SREs work with. This provides a baseline level of knowledge across all new SREs, and simplifies team-specific and service-specific training objectives.

The SRE EDU team also runs a second series of classes a few months later that covers the common tools and processes that we use for managing major incidents.

### Horizontal Projects

Because SRE teams are tightly aligned with a set of services, there is a temptation for teams to build proprietary solutions to deal with the challenges they encounter — for example, monitoring, software rollout, and configuration tools. This can lead to significant duplication of efforts across teams. While there is value in allowing a number of solutions to compete for "market" adoption, at some point, it makes sense to converge upon a standard solution that:

- Meets most teams' requirements
- Provides a stable and scalable platform upon which the next layer of innovation can be built

Google approaches these efforts by using horizontal teams, which are often staffed by experienced SREs. These horizontal teams build and run a standard solution and partner with other SRE teams to ensure smooth adoption.

### Production Excellence

At Google, we run a regular service review called Production Excellence. On a regular basis, senior SRE leaders review every SRE team, assessing them on a number of standard measures (e.g., pager load, error budget usage, project completion, bug closure rates). The review both applauds outstanding performance and provides suggestions for underperforming teams.

## Conclusion

We believe an organization of any size can implement SRE practices by applying the following three principles:

- SRE needs SLOs with consequences.
- SREs must have time to make tomorrow better than today.
- SRE teams have the ability to regulate their workload.

# Chapter 21 - Organizational Change Management in SRE

---

All individual SRE managers will benefit from familiarity with both the Bridges Transition Model and the Kübler-Ross Change Curve, which provide tools to support employees in times of organizational change.

## Case Study 2: Common Tooling Adoption in SRE

Over time, we learned that how we conducted our development process would inform how potential internal users perceived the end result. These projects gained real traction only when staffed by production-experienced engineers 100% dedicated to building software, with schedules and support identical to the rest of Google's software development. Building common software transparently, like clockwork, with great communication ("We'll have X done by Y date"), greatly improved the speed of migration to the new system. People already trusted the new system because they could observe how it was developed from an early stage. Perceptions of how the sausage is made turned out to be more important than we anticipated from the get-go. Our initial thought that "if you build something great, people will naturally flock to it" didn't hold true. Rather, these projects had to be clearly defined, well advertised in advance, evaluated against a multitude of user cases (targeted to the grumpiest adopters first), leaps and bounds better than existing options, and adoptable with little to no effort.

Often skeptical consumers will ask, "If my current one-off shell script works okay, do I really need this?" Adoption of common software or processes is analogous to reliability as a feature — you may build the best thing in the world, but if people don't adopt it (or can't use it if it's not reliable), it's not useful to anyone.

### Conclusion

However, these frameworks, particularly Kotter's eight-step process and the Prosci ADKAR model, can provide useful insights for approaching change.

## Conclusion

We've long speculated that although the substance and sequence of the dishes are vitally important, people don't have to eat the whole SRE meal at once.
