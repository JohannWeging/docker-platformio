local step(tag) = {
  name: 'version ' + tag,
  image: 'plugins/docker',
  settings: {
    repo: 'johannweging/platformio',
    tags: tag,
    dockerfile: 'Dockerfile',
    username: { from_secret: 'docker_username' },
    password: { from_secret: 'docker_password' },
  },
};

local pipeline(name, tag) = {
  kind: 'pipeline',
  name: name,
  steps: [
    step(tag),
  ],
  trigger: {
    branch: ['master'],
  },
};

[
  pipeline('build amd64', 'latest'),
]
