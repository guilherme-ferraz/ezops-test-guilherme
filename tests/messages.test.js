const request = require('supertest')
const app = require('../server')

const serverHost = 'localhost:3000';

describe('message endpoints', () => {
    it('get messages', async () => {
        const res = await request('localhost:3000').get(`/`);
        expect(res.statusCode).toEqual(200);
    });

    it('get messages especific user', async () => {
        const postId = 'guilherme';
        const res = await request('localhost:3000').get(`/message/guilherme`);
        expect(res.statusCode).toEqual(200);
    });
})